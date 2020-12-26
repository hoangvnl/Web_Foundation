const express = require('express');
const category_module = require('../models/category.model');
const sub_category_module = require('../models/subcategory.model');
const router = express.Router();
console.log('da vao trong ');
router.get('/:cat/:subCat', async function (req, res) {
    const subCat = req.params.subCat;

    const category = await sub_category_module.singleByName(subCat);
    res.render('vwCategories/index', {
        category,
        empty: category.length === 0,
        isSub: true
    })
})

router.get('/:cat', async function (req, res) {
    const cat = req.params.cat;

    const category = await category_module.singleByName(cat);
    res.render('vwCategories/index', {
        category,
        empty: category.length === 0,
        isSub: false
    })
})

module.exports = router;