const express = require('express');
const router = express.Router();
const isAuth = require('../middlewares/auth.mdw');
const userModel = require('../models/user.model');
const bcrypt = require('bcryptjs');
const coursesModel = require('../models/courses.model');
const nodemailer = require('nodemailer');
const joincourseModel = require('../models/joincourse.model');
const lecturerModel = require('../models/lecturer.model');
const subcategoryModel = require('../models/subcategory.model');
const rating_module = require('../models/rating.model');
const crypto = require('crypto');
const tokenModel = require('../models/token.model');


router.get('/edit-profile', isAuth, function (req, res) {
    const user = (req.session.userAuth);
    res.render('vwUser/editProfile', {
        user,
        userName: user.UserName,
        email: user.Email,
        id: user.UserID,

    });

})
router.get('/wishlist', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    const course = await coursesModel.allInWishlistByUserID(user.UserID);

    for (var i in course) {
        course[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(course[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;
    }

    res.render('vwUser/wishlist', {
        course,
        userName: user.UserName,
        email: user.Email,
        id: user.UserID,
    });

})

router.get('/my-course', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    console.log(user.UserID);
    const courseID = await joincourseModel.allByUserID(user.UserID);
    var course = [];

    for (var i in courseID) {
        console.log(courseID[i].CourseID);
        var courseTemp = await coursesModel.singleByID(courseID[+i].CourseID);
        course.push(courseTemp[0]);
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;
    }

    res.render('vwUser/myCourse', {
        course,
        userName: user.UserName,
        email: user.Email,
        id: user.UserID,

    });

})

router.post('/name', async function (req, res) {
    const id = req.body.UserID;
    await userModel.patch(req.body);
    const user = await userModel.singleByID(id);
    req.session.userAuth = user;
    res.redirect('/user/edit-profile');
})
router.post('/email', async function (req, res) {
    console.log(req.body);
    const id = req.body.UserID;
    delete req.body.CurEmail;
    req.body['Verification'] = 0;
    await userModel.patch(req.body);
    req.session.isAuth = false;
    req.session.isLecturer = false;
    req.session.userAuth = null;
    const user = await userModel.singleByID(id);
    const newToken = {
        UserID: user.UserID,
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
        to: user.Email,
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
        user
    });

})
router.post('/password', async function (req, res) {
    const id = req.body.UserID;
    req.body.Password = bcrypt.hashSync(req.body.Password, 7);
    await userModel.patch(req.body);
    const user = await userModel.singleByID(id);
    req.session.userAuth = user;
    res.redirect('/user/edit-profile');
})

router.get('/is-right', async function (req, res) {
    const id = req.query.id;
    const password = req.query.password;
    const user = await userModel.singleByID(id);
    const ret = bcrypt.compareSync(password, user.Password);
    if (ret === false) {
        return res.json(false);
    }
    else {
        return res.json(true);
    }
})

module.exports = router;