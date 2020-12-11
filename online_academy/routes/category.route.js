const express = require('express');
const category_module = require('../models/category.model');

const router = express.Router();

router.get('/', async function (req, res) {
    const rows = await category_module.all();
    console.log(rows);

    res.render('vwCategories/index', {
        categories: rows,
        empty: rows.length === 0
    });

})

router.get('/:id', async function (req, res) {
    const id = req.params.id;
    const category = await category_module.single(id);
    if (catetogry === null) {

    }

})

module.exports = router;