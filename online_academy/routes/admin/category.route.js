const express = require('express');
const router = express.Router();
const categoryModel = require('../../models/admin/category.model');

router.get('/', async function (req, res) {
    const rows = await categoryModel.all();

    res.locals.lcIsCategories = true;
    res.locals.lcIsSubCategories = false;
    res.locals.lcIsCourses = false;
    res.locals.lcIsStudents = false;
    res.locals.lcIsInstructors = false;
    

    res.render('vwAdmin/vwCategories/index', {
        title: 'admincategories',
        layout: 'adminmain',
        categories: rows,
        empty: rows.length === 0
    });
})

module.exports = router;