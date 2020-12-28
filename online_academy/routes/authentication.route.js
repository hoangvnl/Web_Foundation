const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');

router.get('/login', async function (req, res) {
    res.render('vwAuthentication/login');
})
router.get('/register', async function (req, res) {
    res.render('vwAuthentication/register');
})
router.post('/register', async function (req, res) {
    const hash = bcrypt.hashSync(req.body.password, 7);
    const user = {
        username: req.body.username,
        password: hash,
        permission: 0,
        email: req.body.email
    }

    await userModel.add(user);
    res.render('vwAuthentication/register');
})

router.get('/is-available', async function (req, res) {
    const email = req.query.email;
    const isVal = await userModel.singleByEmail(email);
    if (isVal === null) {
        return res.json(true);
    }
    else {
        return res.json(false);
    }
})

module.exports = router;