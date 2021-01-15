const express = require('express');
const router = express.Router();
const courseModel = require('../../models/admin/course.model');
const subcategoryModel = require('../../models/admin/subcategory.model');

router.get('/', async function (req, res) {
    const courses = await courseModel.all();
    const subcategories = await subcategoryModel.all();
    const subName = 'All';

    for(var i = 0; i < courses.length; i++) {
        const lecturers = await courseModel.getLecturersByID(courses[i].CourseID);
        courses[i]['lecturers'] = lecturers;
    }

    // console.log(courses);

    res.locals.lcIsCourses = true;
    res.render('vwAdmin/vwCourses/index', {
        title: 'admincourses',
        layout: 'adminmain',
        courses,
        subcategories,
        subName,
        empty: courses.length === 0
    });
})
//filter 
router.get('/filter/:subid', async function (req, res) {
    // console.log("yes");
    const courses = await courseModel.allBySubcategory(req.params.subid);
    const subcategories = await subcategoryModel.all();
    let subName = "";

    console.log(subcategories);
    subcategories.forEach(Element => {
        if(Element.SubcategoryID == req.params.subid) {
            subName = Element.SubcategoryName;
        }
    })

    for(var i = 0; i < courses.length; i++) {
        const lecturers = await courseModel.getLecturersByID(courses[i].CourseID);
        courses[i]['lecturers'] = lecturers;
    }

    // console.log(+req.params.subid)

    res.locals.lcIsCourses = true;
    res.render('vwAdmin/vwCourses/index', {
        title: 'admincourses',
        layout: 'adminmain',
        courses,
        subcategories,
        subSelected: +req.params.subid,
        subName,
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

//disables
router.post("/disable/:id", async (req, res) => {
    const courseID = req.params.id;
    const course = {CourseID: courseID, isDisabled: '1'};

    const ret = await courseModel.patch(course);

    res.redirect("/admin/courses");
})
//enable
router.post("/enable/:id", async (req, res) => {
    const courseID = req.params.id;
    const course = {CourseID: courseID, isDisabled: '0'};

    const ret = await courseModel.patch(course);

    res.redirect("/admin/courses");
})

//update
router.post("/patch", async function (req, res) {
    // console.log(req.body);
    const ret = await subcategoryModel.patch(req.body);
    res.redirect("/admin/subcategories");
});

module.exports = router;