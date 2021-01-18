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
const contentModel = require('../models/content.model');
const watchedLectureModel = require('../models/watchedLecture.model');


router.get('/:param', async function (req, res) {
    const param = req.params.param;
    const course = await course_module.singleByName(param);
    var entityView = { CourseID: course[0].CourseID, View: +(course[0].View) + 1 };
    await coursesModel.patch(entityView);//update view

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
        review[i]['rate'] = +review[i].Rate;



    }

    for (i = 0; i < review.length; i++) {
        var userTemp = await userModel.singleByID(review[i].UserID);
        review[i]['UserName'] = userTemp.UserName;
        var name = userTemp.UserName;
        var shortName;
        var pos = name.lastIndexOf(" ");
        if (pos === -1) {
            shortName = name.substr(0, 1);
        }
        else {
            shortName = name.substr(pos, 2);
        }
        review[i]['shortName'] = shortName;
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
    // console.log(review);
    course[0]['review'] = review;

    var rate_5 = 0;
    var rate_4 = 0;
    var rate_3 = 0;
    var rate_2 = 0;
    var rate_1 = 0;

    for (i = 0; i < review.length; i++) {
        if (review[i].rate === 5) {
            rate_5++;
        }
        if (review[i].rate === 4) {
            rate_4++;
        }
        if (review[i].rate === 3) {
            rate_3++;
        }
        if (review[i].rate === 2) {
            rate_2++;
        }
        if (review[i].rate === 1) {
            rate_1++;
        }
    }

    rate_5 = rate_5 / review.length * 100;
    rate_4 = rate_4 / review.length * 100;
    rate_3 = rate_3 / review.length * 100;
    rate_2 = rate_2 / review.length * 100;
    rate_1 = rate_1 / review.length * 100;

    const content = await content_module.allWithCourseID(course[0].CourseID);
    course[0]['content'] = content;
    course[0]['fulldes'] = await fulldes_module.allByCourseID(course[0].CourseID);
    var isInWishlist = 0;
    var isInCart = 0;
    var isBought = false;
    var reviewed;
    if (typeof (req.session.userAuth) !== 'undefined' && req.session.userAuth !== null) {
        const user = req.session.userAuth;
        const joinCourse = await joincourseModel.allByUserID(user.UserID);
        for (var i in joinCourse) {
            if (+joinCourse[i].CourseID === +course[0].CourseID)
                isBought = true;
        }
        course[0]['userName'] = user.UserName;
        reviewed = await reviewModel.getReviewIfReviewed(user.UserID, course[0].CourseID);
        console.log(reviewed);
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

        for (i = 0; i < lecture.length; i++) {
            if (await watchedLectureModel.checkIsWatched(lecture[i].LectureID)) {
                lecture[i]['isWatch'] = true;
            }
            else {
                lecture[i]['isWatch'] = false;
            }
        }

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
        reviewed,
        countStudent,
        countCourse,
        countReview,
        countRating,
        rate_5,
        rate_4,
        rate_3,
        rate_2,
        rate_1,
    });
})

router.post('/watch/:param', async function (req, res) {
    var param = req.params.param;//LectureID
    console.log(param);
    if (req.session.isAuth) {
        var user = req.session.userAuth;
        var courseID = await coursesModel.findIDByLectureID(param);
        courseID = courseID[0].CourseID;
        var curLecture = await watchedLectureModel.allByUserIDAndCourseID(user.UserID, courseID);
        // console.log(curLecture);
        for (i = 0; i < curLecture.length; i++) {
            if (+curLecture[i].CurrentLecture === +param)
                return;
        }
        var entity = { UserID: user.UserID, CourseID: courseID, CurrentLecture: +param };
        await watchedLectureModel.add(entity);
    }


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
    var entity = {
        UserID: user.UserID,
        CourseID: courseID,
        Rate: +(req.body.rating),
        Comment: req.body.Comment
    };

    await reviewModel.add(entity);
    const rating = await ratingModel.singleByCourseID(courseID);
    entity = {
        CourseID: courseID,
        TotalVotes: rating[0].TotalVotes + 1,
        TotalRates: rating[0].TotalRates + (+(req.body.rating)),
    }
    await ratingModel.patch(entity);

    let url = '/course/' + req.body.CourseName;
    res.redirect(url);
})

module.exports = router;