const express = require('express');
const router = express.Router();
const course_module = require('../models/courses.model');
const cart_module = require('../models/cart.model');
const joincourse_module = require('../models/joincourse.model');
const dateFormat = require("dateformat");


router.get('/', function (req, res) {
    res.render('vwCart/index', {
        course: req.session.cart,
        count: req.session.cart.length,
        total: cart_module.total(req.session.cart),
    });
})
router.post('/add', async function (req, res) {
    const courseName = req.body.CourseName;
    const courseTemp = await course_module.singleByName(courseName);
    const course = courseTemp[0];
    cart_module.add(req.session.cart, course);
    res.redirect(req.headers.referer);
})
router.post('/remove', async function (req, res) {
    const courseName = req.body.CourseName;
    const courseTemp = await course_module.singleByName(courseName);
    const course = courseTemp[0];
    cart_module.del(req.session.cart, course);
    res.redirect(req.headers.referer);

})
router.post('/buy', async function (req, res) {
    const course = req.session.cart;
    const UserID = req.session.userAuth.UserID;
    const JoinDate = dateFormat(now, "isoDate");
    for (var i in course) {
        const CourseID = course[i].CourseID;
        const entity = { UserID, CourseID, JoinDate };
        await joincourse_module.add(entity);
    }
    res.redirect(req.headers.referer);
})
router.post('/:buy/:CourseName', async function (req, res) {
    const courseName = req.params.CourseName;
    const course = await course_module.singleByName(courseName);
    const now = new Date();
    // console.log(req.session.userAuth.UserID);
    // console.log(course[0].CourseID);
    // console.log(dateFormat(now, "isoDate"));
    const UserID = req.session.userAuth.UserID;
    const CourseID = course[0].CourseID;
    const JoinDate = dateFormat(now, "isoDate");
    const entity = { UserID, CourseID, JoinDate };
    await joincourse_module.add(entity);
    res.redirect(req.headers.referer);
})
module.exports = router;