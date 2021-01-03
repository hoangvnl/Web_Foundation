const express = require('express');
const router = express.Router();
const course_module = require('../models/courses.model');
const lecturer_module = require('../models/lecturer.model');
const rating_module = require('../models/rating.model');
const content_module = require('../models/content.model');
const lecture_module = require('../models/lecture.model');
const isAuth = require('../middlewares/auth.mdw');
const wishlist = require('../models/wishlist.model');
const fulldes_module = require('../models/fulldes.model');


router.get('/:param', async function (req, res) {
    const param = req.params.param;
    const course = await course_module.singleByName(param);
    course[0]['lecturerName'] = await lecturer_module.getNameByCourseID(course[0].CourseID);
    const rating = await rating_module.singleByCourseID(course[0].CourseID);
    course[0]['totalRates'] = rating[0].TotalRates;
    course[0]['totalVotes'] = rating[0].TotalVotes;
    course[0]['rate'] = rating[0].TotalRates / rating[0].TotalVotes;
    const content = await content_module.allWithCourseID(course[0].CourseID);
    course[0]['content'] = content;
    course[0]['fulldes'] = await fulldes_module.allByCourseID(course[0].CourseID);
    var isInWishlist = 0;

    if (req.session.isAuth) {
        const userID = req.session.userAuth.UserID;
        const courseID = course[0].CourseID;

        if (await wishlist.checkWishlist(userID, courseID)) {
            isInWishlist = 1;
        }
        else {
            isInWishlist = 0;
        }
    }

    for (var count in course[0].content) {
        var contentTemp = course[0].content[count];
        var lecture = await lecture_module.allWithContentID(contentTemp.ContentID);

        course[0].content[count]['lecture'] = lecture;
    }

    res.render('vwCourse/detail', {
        course,
        isInWishlist
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


module.exports = router;