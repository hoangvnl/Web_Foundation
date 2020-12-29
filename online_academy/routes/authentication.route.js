const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const userModel = require('../models/user.model');
const tokenModel = require('../models/token.model')

router.get('/login', async function (req, res) {
    res.render('vwAuthentication/login');
    if (req.headers.referer) {
        req.session.retUrl = req.headers.referer;
    }

})

router.post('/login', async function (req, res) {
    const user = await userModel.singleByEmail(req.body.email);
    if (user === null) {
        return res.render('vwAuthentication/login', {
            err_message: 'Invalid email or password.'
        });
    }

    const ret = bcrypt.compareSync(req.body.password, user.password);
    if (ret === false) {
        return res.render('vwAuthentication/login', {
            err_message: 'Invalid email or password.'
        });
    }

    if (!user.isverified) {
        return res.render('vwAuthentication/pending', {
            email: user.email
        });
    }

    req.session.isAuth = true;
    req.session.userAuth = user;


    let url = req.session.retUrl || '/';
    res.redirect(url);
})

router.post('/logout', async function (req, res) {

    req.session.isAuth = false;
    req.session.userAuth = null;
    res.redirect(req.headers.referer);
})

router.get('/register', async function (req, res) {
    res.render('vwAuthentication/register');
})

router.post('/register', async function (req, res) {


    const hash = bcrypt.hashSync(req.body.password, 7);
    const user = {
        username: req.body.username,
        password: hash,
        permission: 0,
        email: req.body.email,
        isverified: 0
    }

    await userModel.add(user);
    const row = await userModel.singleByEmail(user.email);

    const newToken = {
        userid: row.id,
        token: crypto.randomBytes(16).toString('hex')
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
        to: row.email,
        subject: 'Account Verification Token',
        text: 'Hello,\n\n' + 'Please verify your account by clicking the link: \nhttp:\/\/' + req.headers.host + '\/join\/confirmation\/' + newToken.token + '\n'
    };
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });


    res.render('vwAuthentication/pending', {
        email: row.email
    });
})

router.get('/:confirmation/:token', async function (req, res) {
    console.log('da vao confirmation');
    const token = req.params.token;
    console.log(token);
    const row = await tokenModel.singleByToken(token);
    console.log(row);
    if (row === null) {

    }
    else {
        const user = await userModel.singleByID(row.userid);
        userModel.verify(user.id);
        res.render('vwAuthentication/confirmed');
        req.session.isAuth = true;
        req.session.userAuth = user;
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