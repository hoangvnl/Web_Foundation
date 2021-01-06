const express = require('express');
const router = express.Router();
const subcategoryModel = require('../../models/admin/subcategory.model');
const categoryModel = require('../../models/admin/category.model');

router.get('/', async function (req, res) {
    const rows = await subcategoryModel.all();

    res.locals.lcIsSubCategories = true;
    res.render('vwAdmin/vwSubCategories/index', {
        title: 'adminsubcategories',
        layout: 'adminmain',
        subcategories: rows,
        empty: rows.length === 0
    });
})

// add
router.get('/add', async function (req, res) {
    res.locals.lcIsSubCategories = true;
    
    
    const catRows = await categoryModel.all();
    res.render('vwAdmin/vwSubCategories/add', {
        title: 'adminsubcategories',
        layout: 'adminmain',
        categories: catRows
    });
})
router.post('/add', async function (req, res) {
    res.locals.lcIsSubCategories = true;

    const ret = await subcategoryModel.add(req.body);
    
    const catRows = await categoryModel.all();
    res.render('vwAdmin/vwSubCategories/add', {
        title: 'adminsubcategories',
        layout: 'adminmain',
        categories: catRows
    });
  });

// edit
router.get("/:id", async function (req, res) {
    const id = req.params.id;
    const subcategory = await subcategoryModel.single(id);
    if (subcategory === null) {
        return res.redirect("/admin/subcategories");
    }

    const isDeletable = await subcategoryModel.isDeletable(id);
    const isActive = !isDeletable;

    const catRows = await categoryModel.all();

    res.locals.lcIsSubCategories = true;
    res.render("vwAdmin/vwSubCategories/edit", {
        title: 'adminsubcategories',
        layout: 'adminmain',
        subcategory,
        isActive
    });
});

// del
router.post("/del", async function (req, res) {
    const ret = await subcategoryModel.del(req.body);
    res.redirect("/admin/subcategories");
});

//update
router.post("/patch", async function (req, res) {
    // console.log(req.body);
    const ret = await subcategoryModel.patch(req.body);
    res.redirect("/admin/subcategories");
});

module.exports = router;