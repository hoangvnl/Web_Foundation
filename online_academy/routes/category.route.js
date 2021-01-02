const express = require('express');
const category_module = require('../models/category.model');
const sub_category_module = require('../models/subcategory.model');
const course_module = require('../models/courses.model');
const lecturer_module = require('../models/lecturer.model');
const rating_module = require('../models/rating.model');
const router = express.Router();

router.post('/results', async function (req, res) {
    console.log(req.body);
    const rows = await sub_category_module.searchByName(req.body.searchText);
    let courseTemp = [];
    let course = [];
    for (var i in rows) {
        courseTemp[+i] = await course_module.singleByName(rows[i].CourseName);
    }
    for (var i in rows) {
        course[i] = courseTemp[i][0];
        course[+i]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+i].CourseID);
        const catName = await sub_category_module.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;
    }

    res.render('vwCategories/index', {
        isSearch: true,
        course,
        searchText: req.body.searchText,
        empty: rows.length === 0,
    })

})

router.get('/:cat/:subCat', async function (req, res) {
    const subCat = req.params.subCat;
    const category = await sub_category_module.singleByName(subCat);
    const catID = await sub_category_module.getIDByName(subCat);
    const course = await course_module.allWithSubCatID(catID);

    for (var courseTemp in course) {
        course[+courseTemp]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+courseTemp].CourseID);
        course[+courseTemp]['catName'] = category[0].SubcategoryName;
        var rating = await rating_module.singleByCourseID(course[+courseTemp].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+courseTemp]['rate'] = rate;
    }

    res.render('vwCategories/index', {
        category,
        course,

    })
})

router.get('/:cat', async function (req, res) {
    const cat = req.params.cat;
    const category = await category_module.singleByName(cat);
    const catID = await category_module.getIDByName(cat);
    const course = await course_module.allWithCatID(catID);

    for (var courseTemp in course) {
        course[+courseTemp]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+courseTemp].CourseID);
        const catName = await sub_category_module.getNameByID(course[+courseTemp].SubCategoryID);
        course[+courseTemp]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+courseTemp].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+courseTemp]['rate'] = rate;
    }

    res.render('vwCategories/index', {
        category,
        course,

    })
})



module.exports = router;