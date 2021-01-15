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
const topModel = require('../models/top.model');
const wishlistModel = require('../models/wishlist.model');
const contentModel = require('../models/content.model');
const lectureModel = require('../models/lecture.model');
const watchedLectureModel = require('../models/watchedLecture.model');


router.get('/edit-profile', isAuth, function (req, res) {
    const user = (req.session.userAuth);
    res.render('vwUser/editProfile', {
        user,
        userName: user.UserName,
        shortName: res.locals.userAuth.shortName,
        email: user.Email,
        id: user.UserID,

    });

})
router.get('/wishlist', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    const course = await coursesModel.allInWishlistByUserID(user.UserID);
    var newCourse = await topModel.getNewCourse();

    for (var i in course) {
        course[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(course[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;

        for (j = 0; j < newCourse.length; j++) {
            if (course[+i].CourseID === newCourse[j].CourseID) {
                course[+i]['isNew'] = true;
            }
        }

        var bestsellerCourse = await topModel.getBestSeller(course[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (course[+i].CourseID === bestsellerCourse[j].CourseID) {
                course[+i]['isBestSeller'] = true;

            }

        }

        if (course[+i].isDisabled === 1) {
            delete course[i];
        }
    }
    console.log(course);
    res.render('vwUser/wishlist', {
        course,
        userName: user.UserName,
        shortName: res.locals.userAuth.shortName,
        email: user.Email,
        id: user.UserID,
    });

})
router.post('/wishlist', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    var entityWL = { UserID: user.UserID, CourseID: req.body.CourseID };
    await wishlistModel.del(entityWL);

    res.redirect('/user/wishlist')
})

router.get('/my-course', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    // console.log(user.UserID);
    const courseID = await joincourseModel.allByUserID(user.UserID);
    var course = [];
    var newCourse = await topModel.getNewCourse();

    for (var i in courseID) {
        // console.log(courseID[i].CourseID);
        var courseTemp = await coursesModel.singleByID(courseID[+i].CourseID);
        course.push(courseTemp[0]);
        course[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(course[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;

        for (j = 0; j < newCourse.length; j++) {
            if (course[+i].CourseID === newCourse[j].CourseID) {
                course[+i]['isNew'] = true;
            }
        }

        var bestsellerCourse = await topModel.getBestSeller(course[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (course[+i].CourseID === bestsellerCourse[j].CourseID) {
                course[+i]['isBestSeller'] = true;

            }

        }

        if (course[+i].isDisabled === 1) {
            delete course[i];
        }


        var contentByCourseID = await contentModel.allWithCourseID(course[i].CourseID);
        var countLecture = 0;
        for (j = 0; j < contentByCourseID.length; j++) {
            var lectureByContentID = await lectureModel.allWithContentID(contentByCourseID[j].ContentID);
            countLecture += lectureByContentID.length;
        }
        var watched = await watchedLectureModel.allByUserIDAndCourseID(user.UserID, course[i].CourseID);
        var progress = watched.length / countLecture * 100;
        console.log(progress);
        course[i]['progress'] = progress;
    }


    res.render('vwUser/myCourse', {
        course,
        userName: user.UserName,
        shortName: res.locals.userAuth.shortName,
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