const express = require('express');
const router = express.Router();

router.get('/des', function (req, res) {
    res.render('test');
})
router.post('/des', function (req, res) {
    console.log('-----------------------------------COPY CAI DONG NAY--------------------------------------');
    console.log(req.body.FullDes);
    res.render('test');
})

module.exports = router;