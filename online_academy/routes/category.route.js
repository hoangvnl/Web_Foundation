const express = require('express');
const category_module = require('../models/category.model');
const sub_category_module = require('../models/subcategory.model');
const course_module = require('../models/courses.model');
const lecturer_module = require('../models/lecturer.model');
const rating_module = require('../models/rating.model');
const config = require('../config/default.json');
const topModel = require('../models/top.model');
const router = express.Router();

router.get('/search', async function (req, res) {
    // console.log(req.query);
    var page = req.query.page || 1;
    if (page <= 0) page = 1;
    const offset = (page - 1) * config.pagination.limit;
    const p = req.query.p;
    const sort = req.query.sort;
    let rows;
    var newCourse = await topModel.getNewCourse();
    // console.log(newCourse);
    if (sort === 'rate') {
        rows = await sub_category_module.searchPageByNameSortRate(p, offset);
    }
    else if (sort === 'cost') {
        rows = await sub_category_module.searchPageByNameSortCost(p, offset);
    }
    else {
        rows = await sub_category_module.searchPageByName(p, offset);
    }
    const total = await sub_category_module.countCourseSearchByName(p);
    const nPages = Math.ceil(total / config.pagination.limit);
    if (page > nPages) page = nPages;
    const page_items = [];
    for (var i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i == page,
        }
        page_items.push(item);
    }
    // console.log(rows);
    let courseTemp = [];
    let course = [];
    for (var i in rows) {
        courseTemp[+i] = await course_module.singleByName(rows[i].CourseName);
    }
    // console.log(courseTemp);
    for (var i in rows) {
        course[i] = courseTemp[i][0];
        course[+i]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+i].CourseID);
        const catName = await sub_category_module.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        // console.log(rating);
        if (rating.length > 0) {
            var rate = rating[0].TotalRates / rating[0].TotalVotes;
            course[+i]['rate'] = rate;
        }
        else {
            course[+i]['rate'] = 0;
        }

        for (j = 0; j < newCourse.length; j++) {
            if (course[i].CourseID == newCourse[j].CourseID) {
                course[i]['isNew'] = true;
            }

        }

        var bestsellerCourse = await topModel.getBestSeller(course[i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (course[i].CourseID == bestsellerCourse[j].CourseID) {
                course[i]['isBestSeller'] = true;
            }

        }

        if (course[i].isDisabled === 1) {
            delete course[i];
        }
    }



    const searchParam = ('&p=' + p + '&sort=' + sort);
    // console.log(course);

    res.render('vwCategories/index', {
        isSearch: true,
        course,
        cost: sort === 'cost',
        rate: sort === 'rate',
        p,
        empty: rows.length === 0,
        page_items,
        next_page: +page + 1,
        pre_page: +page - 1,
        can_go_next: +page < +nPages,
        can_go_pre: +page > 1,
        total,
        searchParam
    })

})

router.get('/:cat/:subCat', async function (req, res) {
    const page = req.query.page || 1;
    if (page <= 0) page = 1;
    const offset = (page - 1) * config.pagination.limit;
    const subCat = req.params.subCat;
    const category = await sub_category_module.singleByName(subCat);
    const catID = await sub_category_module.getIDByName(subCat);
    const course = await course_module.pageWithSubCatID(catID, offset);
    const total = await course_module.countAllWithSubCatID(catID);
    const nPages = Math.ceil(total / config.pagination.limit);
    if (page > nPages) page = nPages;
    const page_items = [];
    for (var i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i == page,
        }
        page_items.push(item);
    }

    var newCourse = await topModel.getNewCourse();
    for (var i in course) {
        course[+i]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+i].CourseID);
        course[+i]['catName'] = category[0].SubcategoryName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;

        for (j = 0; j < newCourse.length; j++) {
            if (course[+i].CourseID == newCourse[j].CourseID) {
                course[+i]['isNew'] = true;
            }

        }

        var bestsellerCourse = await topModel.getBestSeller(course[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (course[+i].CourseID == bestsellerCourse[j].CourseID) {
                course[+i]['isBestSeller'] = true;
            }

        }

        if (course[+i].isDisabled === 1) {
            delete course[i];
        }

    }

    res.render('vwCategories/index', {
        category,
        course,
        page_items,
        next_page: +page + 1,
        pre_page: +page - 1,
        can_go_next: +page < +nPages,
        can_go_pre: +page > 1,
    })
})

router.get('/:cat', async function (req, res) {
    const page = req.query.page || 1;
    if (page <= 0) page = 1;
    const offset = (page - 1) * config.pagination.limit;
    const cat = req.params.cat;
    const category = await category_module.singleByName(cat);
    const catID = await category_module.getIDByName(cat);
    const course = await course_module.pageWithCatID(catID, offset);
    const total = await course_module.countAllWithCatID(catID);
    const nPages = Math.ceil(total / config.pagination.limit);
    var newCourse = await topModel.getNewCourse();
    if (page > nPages) page = nPages;
    const page_items = [];
    for (var i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i == page,
        }
        page_items.push(item);
    }

    for (var i in course) {
        course[+i]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+i].CourseID);
        const catName = await sub_category_module.getNameByID(course[+i].SubCategoryID);
        course[+i]['catName'] = catName;
        var rating = await rating_module.singleByCourseID(course[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        course[+i]['rate'] = rate;
        for (j = 0; j < newCourse.length; j++) {
            if (course[+i].CourseID == newCourse[j].CourseID) {
                course[+i]['isNew'] = true;
            }

        }

        var bestsellerCourse = await topModel.getBestSeller(course[+i].SubCategoryID);

        for (j = 0; j < bestsellerCourse.length; j++) {
            if (course[+i].CourseID == bestsellerCourse[j].CourseID) {
                course[+i]['isBestSeller'] = true;
            }

        }

        if (course[+i].isDisabled === 1) {
            delete course[i];
        }

    }

    res.render('vwCategories/index', {
        category,
        course,
        page_items,
        next_page: +page + 1,
        pre_page: +page - 1,
        can_go_next: +page < +nPages,
        can_go_pre: +page > 1,
    })
})



module.exports = router;