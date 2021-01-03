const express = require('express');
const router = express.Router();
const course_module = require('../models/courses.model');
const cart_module = require('../models/cart.model');

router.get('/', function (req, res) {
    res.render('vwCart/index', {
        course: req.session.cart,
        count: req.session.cart.length
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
module.exports = router;