const express = require('express');
const router = express.Router();
const categoryModel = require('../models/admin/category.model');

router.get('/', function (req, res) {
    res.render('vwAdmin/home', { 
      title: 'admin page', 
      layout:'adminmain'});
})

router.get('/categories', async function (req, res) {
  const rows = await categoryModel.all();
  res.render('vwAdmin/vwCategories/index', {
    title: 'admincategories',
    layout: 'adminmain',
    categories: rows,
    empty: rows.length === 0
  });
})

module.exports = router;