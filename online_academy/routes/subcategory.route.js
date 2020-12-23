const express = require('express');
const sub_category_module = require('../models/subcategory.model');
const router = express.Router();

router.get('/:cat', async function (req, res) {
    const cat = req.params.cat;
    const category = await sub_category_module.singleByName(cat);
    res.render('vwCategories/index', {
        category,
        empty: category.length === 0,
        isSub: true
    })
})

module.exports = router;