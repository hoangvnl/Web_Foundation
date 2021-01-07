const express = require('express');
const router = express.Router();
const courseModel = require('../../models/admin/course.model');

router.get('/', async function (req, res) {
    const courses = await courseModel.all();

    for(var i = 0; i < courses.length; i++) {
        const lecturers = await courseModel.getLecturersByID(courses[i].CourseID);
        courses[i]['lecturers'] = lecturers;
    }

    res.locals.lcIsCourses = true;
    res.render('vwAdmin/vwCourses/index', {
        title: 'admincourses',
        layout: 'adminmain',
        courses,
        empty: courses.length === 0
    });
})

// del
router.post("/del", async function (req, res) {
    // const ret = await subcategoryModel.del(req.body);
    console.log(req.body);
    res.redirect("/admin/subcategories");
});
router.post("/del/:id", async function (req, res) {
    // console.log(req.params.id);
    const ret = await courseModel.del(req.params.id);
    res.redirect("/admin/courses");
});

//update
router.post("/patch", async function (req, res) {
    // console.log(req.body);
    const ret = await subcategoryModel.patch(req.body);
    res.redirect("/admin/subcategories");
});

module.exports = router;