const express = require('express');
const router = express.Router();
const isAuth = require('../middlewares/auth.mdw');
const userModel = require('../models/user.model');
const bcrypt = require('bcryptjs');
const coursesModel = require('../models/courses.model');

router.get('/edit-profile', isAuth, function (req, res) {
    const user = (req.session.userAuth);
    res.render('vwUser/editProfile', {
        user,
        userName: user.UserName,
        email: user.Email,
        id: user.UserID,

    });

})
router.get('/wishlist', isAuth, async function (req, res) {
    const user = (req.session.userAuth);
    const course = await coursesModel.allInWishlistByUserID(user.UserID);
    res.render('vwUser/wishlist', {
        course,
        userName: user.UserName,
        email: user.Email,
        id: user.UserID,

    });

})

router.post('/name', async function (req, res) {
    const id = req.body.UserID;
    await userModel.patch(req.body);
    const user = await userModel.singleByID(id);
    req.session.userAuth = user;
    res.redirect('/user/edit-profile');
})
router.post('/email', async function (req, res) {
    console.log(req.body);
    const id = req.body.UserID;
    await userModel.patch(req.body);
    const user = await userModel.singleByID(id);
    req.session.userAuth = user;
    res.redirect('/user/edit-profile');
})
router.post('/password', async function (req, res) {
    const id = req.body.UserID;
    req.body.Password = bcrypt.hashSync(req.body.Password, 7);
    await userModel.patch(req.body);
    const user = await userModel.singleByID(id);
    req.session.userAuth = user;
    res.redirect('/user/edit-profile');
})

router.get('/is-right', async function (req, res) {
    const id = req.query.id;
    const password = req.query.password;
    const user = await userModel.singleByID(id);
    const ret = bcrypt.compareSync(password, user.Password);
    if (ret === false) {
        return res.json(false);
    }
    else {
        return res.json(true);
    }
})

module.exports = router;