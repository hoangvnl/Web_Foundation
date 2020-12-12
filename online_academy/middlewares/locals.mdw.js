const categoryModel = require('../models/category.model');
const subcategoryModel = require('../models/subcategory.model');

module.exports = async function (req, res, next) {
    const cats = await categoryModel.all();

    for (const cat in cats) {
        var subcats = await categoryModel.allWithDetail(+cat + 1);
        console.log(subcats);
        cats[cat]['subs'] = subcats;

    }
    res.locals.lcCategories = cats;

    next()
};