const express = require('express');
const router = express.Router();

router.get('/', function (req, res) {
    res.render('vwAdmin/home', { 
      title: 'admin page', 
      layout:'adminmain'});
})

module.exports = router;