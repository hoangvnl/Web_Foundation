const express = require('express');
const router = express.Router();
const courseModel = require('../../models/admin/course.model');
const joincourseModel = require('../../models/admin/joincouse.model');
const studentModel = require('../../models/admin/student.model');
const bcrypt = require('bcryptjs');

router.get('/', async function (req, res) {
    const students = await studentModel.all();

    res.locals.lcIsStudents = true;
    res.render('vwAdmin/vwStudents/index', {
        title: 'adminlecturers',
        layout: 'adminmain',
        students,
        empty: students.length === 0
    });
})


// edit
router.get("/:id", async function (req, res) {
    const id = req.params.id;
    const student = await studentModel.single(id);
    if (student === null) {
        return res.redirect("/admin/students");
    }

    
    const courses = await courseModel.getAllByUserID(id);
    for(var i = 0; i < courses.length; i++) {
        const lecturers = await courseModel.getLecturersByID(courses[i].CourseID);
        courses[i]['lecturers'] = lecturers;
        courses[i]['userid'] = id;
    }

    res.locals.lcIsStudents = true;
    res.render("vwAdmin/vwStudents/edit", {
        title: 'adminstudents',
        layout: 'adminmain',
        student,
        courses,
        cempty: courses.length === 0
    });
});

// del
router.post("/del", async function (req, res) {
    // const ret = await lecturerModel.del(req.body);
    const student = req.body;
    // console.log(student);
    student['CourseID'].forEach(element => {
        const entity = {CourseID: element, UserID: student['UserID']};
        // console.log(entity);
        const ret1 = joincourseModel.del(entity);
    });
    const ret = studentModel.del(student);
    res.redirect("/admin/students");
});
//delete course
router.post("/courses/del/:userid/:courseid", async function (req, res) {
    const userID = req.params.userid;
    const courseID = req.params.courseid;
    const entity = {UserID: userID, CourseID: courseID};
    // console.log(entity);
    const ret = await joincourseModel.del(entity);
    res.redirect(`/admin/students/${userID}`);
});

//update
router.post("/patch", async function (req, res) {
    // delete req.body.CurrentUserID;
    const student = req.body;
    // console.log(student);
    if(student['isRePass'] == 'true') {
        student['Password'] = '1234';
        student['Password'] = bcrypt.hashSync(student['Password'], 7);
    }
    delete student.CourseID;
    delete student.isRePass;
    // console.log(student);
    const ret = await studentModel.patch(req.body);
    res.redirect("/admin/students");
});

module.exports = router;