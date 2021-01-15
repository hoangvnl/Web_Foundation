const express = require('express');
const categoryModel = require('../models/category.model');
const lecturerModel = require('../models/lecturer.model');
const ratingModel = require('../models/rating.model');
const subcategoryModel = require('../models/subcategory.model');
const topModel = require('../models/top.model');
const router = express.Router();

router.get('/', async function (req, res) {
    var newCourse = await topModel.getNewCourse();
    const top10AllCat = await topModel.top10AllCat();
    const top10NewAllCat = await topModel.top10NewAllCat();
    if (req.session.isLecturer === true) {
        console.log('thoat giao vien');
        req.session.isLecturer = false;
        req.session.userAuth = null;
    }
    if (req.session.isAdmin === true) {
        req.session.isAdmin = false;
        req.session.userAuth = null;
    }


    for (var i in top10AllCat) {
        top10AllCat[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(top10AllCat[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(top10AllCat[+i].SubCategoryID);
        top10AllCat[+i]['catName'] = catName;
        var rating = await ratingModel.singleByCourseID(top10AllCat[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        top10AllCat[+i]['rate'] = rate;


        for (j = 0; j < newCourse.length; j++) {
            if (top10AllCat[+i].CourseID === newCourse[j].CourseID) {
                top10AllCat[+i]['isNew'] = true;
            }
        }

        var bestsellerCourse = await topModel.getBestSeller(top10AllCat[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (top10AllCat[+i].CourseID === bestsellerCourse[j].CourseID) {
                top10AllCat[+i]['isBestSeller'] = true;

            }

        }
    }
    // console.log(top10AllCat);
    var first4AllCat = [];
    var second4AllCat = [];
    var final2AllCat = [];
    final2AllCat.push(top10AllCat[8]);
    final2AllCat.push(top10AllCat[9]);
    for (i = 0; i <= 3; i++) {
        first4AllCat.push(top10AllCat[i]);
        second4AllCat.push(top10AllCat[i + 4]);
    }
    // console.log(first4AllCat);


    for (var i in top10NewAllCat) {
        top10NewAllCat[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(top10NewAllCat[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(top10NewAllCat[+i].SubCategoryID);
        top10NewAllCat[+i]['catName'] = catName;
        var rating = await ratingModel.singleByCourseID(top10NewAllCat[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        top10NewAllCat[+i]['rate'] = rate;

        for (j = 0; j < newCourse.length; j++) {
            if (top10NewAllCat[+i].CourseID === newCourse[j].CourseID) {
                top10NewAllCat[+i]['isNew'] = true;
            }

        }

        var bestsellerCourse = await topModel.getBestSeller(top10NewAllCat[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (top10NewAllCat[+i].CourseID === bestsellerCourse[j].CourseID) {
                top10NewAllCat[+i]['isBestSeller'] = true;

            }

        }
    }
    var first4NewAllCat = [];
    var second4NewAllCat = [];
    var final2NewAllCat = [];
    final2NewAllCat.push(top10NewAllCat[8]);
    final2NewAllCat.push(top10NewAllCat[9]);
    for (i = 0; i <= 3; i++) {
        first4NewAllCat.push(top10NewAllCat[i]);
        second4NewAllCat.push(top10NewAllCat[i + 4]);
    }


    var categoryOfTheWeek = await topModel.categoryOfTheWeek();
    for (i = 0; i < categoryOfTheWeek.length; i++) {
        var catTemp = await categoryModel.single(categoryOfTheWeek[i].CategoryID);
        categoryOfTheWeek[i]['categoryName'] = catTemp[0].CategoryName;
    }

    // console.log(categoryOfTheWeek);
    var courseOfTheWeek = await topModel.courseOfTheWeek();
    for (i = 0; i < courseOfTheWeek.length; i++) {
        var ratingTempCourseOfTheWeek = await ratingModel.singleByCourseID(courseOfTheWeek[i].CourseID);
        courseOfTheWeek[i]['rate'] = ratingTempCourseOfTheWeek[0].TotalRates / ratingTempCourseOfTheWeek[0].TotalVotes;
        for (j = 0; j < newCourse.length; j++) {
            if (courseOfTheWeek[+i].CourseID === newCourse[j].CourseID) {
                courseOfTheWeek[+i]['isNew'] = true;
            }

        }

        var bestsellerCourse = await topModel.getBestSeller(courseOfTheWeek[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (courseOfTheWeek[+i].CourseID === bestsellerCourse[j].CourseID) {
                courseOfTheWeek[+i]['isBestSeller'] = true;

            }

        }
    }



    res.render('home', {
        first4AllCat,
        second4AllCat,
        final2AllCat,
        first4NewAllCat,
        second4NewAllCat,
        final2NewAllCat,
        categoryOfTheWeek,
        courseOfTheWeek,
    });
});

module.exports = router;