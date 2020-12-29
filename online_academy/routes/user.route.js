const express = require('express');
const router = express.Router();
const isAuth = require('../middlewares/auth.mdw');


router.get('/edit-profile', isAuth, function (req, res) {
    res.render('vwUser/editProfile');

})

module.exports = router;