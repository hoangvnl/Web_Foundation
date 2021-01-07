const express = require('express');
const router = express.Router();
const courseModel = require('../../models/admin/course.model');
const lecturerModel = require('../../models/admin/lecturer.model');
const lectureModelHoang = require('../../models/lecturer.model');
const accountModel = require('../../models/admin/account.model');

router.get('/', async function (req, res) {
    const lecturers = await lecturerModel.all();

    res.locals.lcIsLecturers = true;
    res.render('vwAdmin/vwLecturers/index', {
        title: 'adminlecturers',
        layout: 'adminmain',
        lecturers,
        empty: lecturers.length === 0
    });
})


// add
router.get('/add', async function (req, res) {
    res.locals.lcIsLecturers = true;
    const users = await accountModel.getAvailableLecturer();
    res.render('vwAdmin/vwLecturers/add', {
        title: 'adminlecturers',
        layout: 'adminmain',
        users
    });
})
router.post('/add', async function (req, res) {
    res.locals.lcIsLecturers = true;


    // const catRows = await categoryModel.all();
    // console.log(req.body);
    const ret = await lecturerModel.add(req.body);

    res.render('vwAdmin/vwLecturers/add', {
        title: 'adminaccounts',
        layout: 'adminmain'
    });
});

// edit
router.get("/:id", async function (req, res) {
    const id = req.params.id;
    const lecturer = await lecturerModel.single(id);
    if (lecturer === null) {
        return res.redirect("/admin/lecturers");
    }

    const users = await accountModel.getAvailableLecturer();

    const countStudent = await lectureModelHoang.countStudent(id);
    const countCourse = await lectureModelHoang.countCourse(id);
    const countRating = await lectureModelHoang.countRating(id);
    const countReview = await lectureModelHoang.countReview(id);

    
    const courses = await courseModel.getAllByLecturerID(id);
    for(var i = 0; i < courses.length; i++) {
        const lecturers = await courseModel.getLecturersByID(courses[i].CourseID);
        courses[i]['lecturers'] = lecturers;
    }

    res.locals.lcIsLecturers = true;
    res.render("vwAdmin/vwLecturers/edit", {
        title: 'adminsubcategories',
        layout: 'adminmain',
        lecturer,
        countCourse,
        countRating,
        countReview,
        countStudent,
        courses,
        cempty: courses.length === 0,
        users
    });
});

// del
router.post("/del", async function (req, res) {
    const ret = await lecturerModel.del(req.body);
    // console.log(req.body);
    res.redirect("/admin/lecturers");
});

//update
router.post("/patch", async function (req, res) {
    delete req.body.CurrentUserID;
    // console.log(req.body);
    const ret = await lecturerModel.patch(req.body);
    res.redirect("/admin/lecturers");
});

module.exports = router;