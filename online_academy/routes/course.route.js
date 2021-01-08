const express = require('express');
const router = express.Router();
const course_module = require('../models/courses.model');
const rating_module = require('../models/rating.model');
const content_module = require('../models/content.model');
const lecture_module = require('../models/lecture.model');
const isAuth = require('../middlewares/auth.mdw');
const wishlist = require('../models/wishlist.model');
const fulldes_module = require('../models/fulldes.model');
const joincourseModel = require('../models/joincourse.model');
const lecturerModel = require('../models/lecturer.model');
const topModel = require('../models/top.model');
const subcategoryModel = require('../models/subcategory.model');
const coursesModel = require('../models/courses.model');
const ratingModel = require('../models/rating.model');
const reviewModel = require('../models/review.model');
const userModel = require('../models/user.model');


router.get('/:param', async function (req, res) {
    const param = req.params.param;
    const course = await course_module.singleByName(param);
    course[0]['lecturerName'] = await lecturerModel.getNameByCourseID(course[0].CourseID);
    // console.log(course[0].lecturerName);
    const lecturer = await lecturerModel.singleByName(course[0].lecturerName);
    const countStudent = await lecturerModel.countStudent(lecturer[0].LecturerID);
    const countCourse = await lecturerModel.countCourse(lecturer[0].LecturerID);
    const countRating = await lecturerModel.countRating(lecturer[0].LecturerID);
    const countReview = await lecturerModel.countReview(lecturer[0].LecturerID);
    const rating = await rating_module.singleByCourseID(course[0].CourseID);
    const review = await reviewModel.allByCourseID(course[0].CourseID);

    for (i = 0; i < review.length; i++) {
        var userTemp = await userModel.singleByID(review[i].UserID);
        review[i]['UserName'] = userTemp.UserName;
    }

    // console.log(rating);
    if (rating.length > 0) {
        course[0]['totalRates'] = rating[0].TotalRates;
        course[0]['totalVotes'] = rating[0].TotalVotes;
        course[0]['rate'] = rating[0].TotalRates / rating[0].TotalVotes;
    }
    else {
        course[0]['rate'] = 0;
    }

    course[0]['review'] = review;

    const content = await content_module.allWithCourseID(course[0].CourseID);
    course[0]['content'] = content;
    course[0]['fulldes'] = await fulldes_module.allByCourseID(course[0].CourseID);
    var isInWishlist = 0;
    var isInCart = 0;
    var isBought = false;
    if (typeof (req.session.userAuth) !== 'undefined' && req.session.userAuth !== null) {
        const user = req.session.userAuth;
        const joinCourse = await joincourseModel.allByUserID(user.UserID);
        for (var i in joinCourse) {
            if (+joinCourse[i].CourseID === +course[0].CourseID)
                isBought = true;
        }
    }

    if (req.session.isAuth) {
        const userID = req.session.userAuth.UserID;
        const courseID = course[0].CourseID;

        if (await wishlist.checkWishlist(userID, courseID)) {
            isInWishlist = 1;
        }
        else {
            isInWishlist = 0;
        }

        for (temp of req.session.cart) {
            if (temp.CourseID === course[0].CourseID)
                isInCart = 1;
        }
    }

    for (var count in course[0].content) {
        var contentTemp = course[0].content[count];
        var lecture = await lecture_module.allWithContentID(contentTemp.ContentID);

        course[0].content[count]['lecture'] = lecture;
    }

    const fiveCourseID = await topModel.fiveCourseSameCat(course[0].CourseID);
    var fiveCourse = [];

    for (var i in fiveCourseID) {
        var courseTemp = await coursesModel.singleByID(fiveCourseID[i].CourseID);
        fiveCourse.push(courseTemp[0]);
    }

    for (var i in fiveCourse) {
        fiveCourse[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(fiveCourse[+i].CourseID);
        var rating2 = await ratingModel.singleByCourseID(fiveCourse[+i].CourseID);
        rate = rating2[0].TotalRates / rating2[0].TotalVotes;
        fiveCourse[+i]['rate'] = rate;
    }

    // console.log(fiveCourse);

    course[0]['fiveCourse'] = fiveCourse;

    res.render('vwCourse/detail', {
        course,
        isInWishlist,
        isInCart,
        isBought,
        countStudent,
        countCourse,
        countReview,
        countRating,
    });
})

router.post('/addWishlist', isAuth, async function (req, res) {
    const user = req.session.userAuth;
    const courseID = req.body.CourseID;
    const entity = {
        UserID: user.UserID,
        CourseID: courseID,
    };
    // console.log(req.body.isInWishlist);
    if (+req.body.isInWishlist) {
        await wishlist.del(entity);
    }
    else {
        await wishlist.add(entity);

    }

    let url = '/course/' + req.body.CourseName;
    res.redirect(url);
})

router.post('/review', isAuth, async function (req, res) {
    const user = req.session.userAuth;
    const courseID = req.body.CourseID;
    const entity = {
        UserID: user.UserID,
        CourseID: courseID,
        Rate: +(req.body.rating),
        Comment: req.body.Comment
    };

    await reviewModel.add(entity);


    let url = '/course/' + req.body.CourseName;
    res.redirect(url);
})

module.exports = router;