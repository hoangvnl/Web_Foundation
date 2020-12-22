const express = require('express');
const category_module = require('../models/category.model');
const router = express.Router();

router.get('/:id', async function (req, res) {
    const id = req.params.id;
    const category = await category_module.single(id);
    res.render('vwCategories/index', {
        category,
        empty: category.length === 0,
        isSub: false
    })
})

module.exports = router;