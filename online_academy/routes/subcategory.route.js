const express = require('express');
const sub_category_module = require('../models/subcategory.model');
const router = express.Router();

router.get('/:id', async function (req, res) {
    const id = req.params.id;
    const category = await sub_category_module.single(id);
    res.render('vwCategories/index', {
        category,
        empty: category.length === 0,
        isSub: true
    })
})

module.exports = router;