const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const userModel = require('../models/user.model');
const tokenModel = require('../models/token.model');
const lecturerModel = require('../models/lecturer.model');

router.get('/login', async function (req, res) {
    res.render('vwAuthentication/login');
    if (req.headers.referer && !req.session.confirmed) {
        req.session.retUrl = req.headers.referer;
    }
})

router.post('/login', async function (req, res) {
    const user = await userModel.singleByEmail(req.body.Email);
    if (user === null) {
        return res.render('vwAuthentication/login', {
            err_message: 'Invalid email or password.'
        });
    }

    const ret = bcrypt.compareSync(req.body.Password, user.Password);
    if (ret === false) {
        return res.render('vwAuthentication/login', {
            err_message: 'Invalid email or password.'
        });
    }

    if (!user.Verification) {
        return res.render('vwAuthentication/pending', {
            email: user.Email
        });
    }

    console.log(user);
    if (user.isLocked === 1) {
        res.render('lockedAccount');
        return;
    }

    req.session.userAuth = user;
    // console.log(user);


    if (+(user.Permission) === 0) {
        req.session.isAuth = true;
        req.session.isLecturer = false;
        console.log('student');
    }
    else if (+(user.Permission) === 1) {
        req.session.isLecturer = true;
        req.session.isAuth = false;
        var lecturer = await lecturerModel.singleByUserID(req.session.userAuth.UserID);
        req.session.userAuth['LecturerID'] = lecturer[0].LecturerID;
        req.session.userAuth['LecturerName'] = lecturer[0].LecturerName;
    }
    else {
        req.session.isAdmin = true;
        req.session.isLecturer = false;
        req.session.isAuth = false;
    }


    req.session.cart = [];

    let url = req.session.retUrl || '/';

    if (req.session.isLecturer === true) {
        res.redirect('/lecturer/course');
    }
    else if (req.session.isAdmin === true) {
        res.redirect('/admin');
    }
    else {

        if (url.indexOf('/lecturer') > 0) {
            url = '/';
        }

        res.redirect(url);
    }
})

router.post('/logout', async function (req, res) {

    req.session.isAuth = false;
    req.session.isLecturer = false;
    req.session.userAuth = null;
    req.session.cart = [];
    if (req.session.isAdmin === true) {
        req.session.isAdmin = false;
        res.redirect('/');
    }
    res.redirect(req.headers.referer);
})

router.get('/register', function (req, res) {
    if (req.session.isAuth === false) {
        res.render('vwAuthentication/register');
    }
    else {
        res.redirect('/');
    }
})

router.post('/register', async function (req, res) {
    const hash = bcrypt.hashSync(req.body.Password, 7);
    const user = {
        UserName: req.body.UserName,
        Password: hash,
        Permission: 0,
        Email: req.body.Email,
        Verification: 0,
        isLocked: 0,
    }

    await userModel.add(user);
    const row = await userModel.singleByEmail(user.Email);

    const newToken = {
        UserID: row.UserID,
        Token: crypto.randomBytes(16).toString('hex')
    };

    await tokenModel.add(newToken);

    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'onlineacademy388421@gmail.com',
            pass: 'onlineacademy'
        }
    });
    var mailOptions = {
        from: 'onlineacademy388421@gmail.com',
        to: row.Email,
        subject: 'Account Verification Token',
        text: 'Hello,\n\n' + 'Please verify your account by clicking the link: \nhttp:\/\/' + req.headers.host + '\/join\/confirmation\/' + newToken.Token + '\n'
    };
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });


    res.render('vwAuthentication/pending', {

        row
    });
})

router.get('/:confirmation/:token', async function (req, res) {
    const token = req.params.token;
    const row = await tokenModel.singleByToken(token);
    if (row === null) {

    }
    else {

        const user = await userModel.singleByID(row.UserID);
        userModel.verify(user.UserID);
        req.session.retUrl = req.headers.referer;
        console.log(req.session.retUrl);
        req.session.confirmed = true;
        var entity = { UserID: user.UserID };
        await tokenModel.del(entity);
        res.render('vwAuthentication/confirmed');
    }

})

router.get('/is-available', async function (req, res) {
    const email = req.query.email;
    const isVal = await userModel.singleByEmail(email);
    if (isVal === null) {
        return res.json(true);
    }
    else {
        return res.json(false);
    }
})

module.exports = router;