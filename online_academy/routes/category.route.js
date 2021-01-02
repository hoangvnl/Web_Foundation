const express = require('express');
const category_module = require('../models/category.model');
const sub_category_module = require('../models/subcategory.model');
const course_module = require('../models/courses.model');
const lecturer_module = require('../models/lecturer.model');
const router = express.Router();



router.get('/:cat/:subCat', async function (req, res) {
    const subCat = req.params.subCat;
    const category = await sub_category_module.singleByName(subCat);
    const catID = await sub_category_module.getIDByName(subCat);
    const course = await course_module.allWithSubCatID(catID);

    for (var courseTemp in course) {
        course[+courseTemp]['lecturerName'] = await lecturer_module.getNameByCourseID(course[+courseTemp].CourseID);
        course[+courseTemp]['catName'] = category[0].SubcategoryName;
    }

    res.render('vwCategories/index', {
        category,
        course,
        empty: category.length === 0,
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
    }

    res.render('vwCategories/index', {
        category,
        course,
        empty: category.length === 0,
    })
})

module.exports = router;