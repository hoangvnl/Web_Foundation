const categoryModel = require('../models/category.model');

module.exports = function (app) {
    app.use(async function (req, res, next) {
        if (typeof (req.session.isAuth) === 'undefined')
            req.session.isAuth = false;

        res.locals.isAuth = req.session.isAuth;
        res.locals.userAuth = req.session.userAuth;
        next();
    })

    app.use(async function (req, res, next) {
        const cats = await categoryModel.all();
        for (const cat in cats) {
            var subcats = await categoryModel.allWithDetail(+cat + 1);
            cats[cat]['subs'] = subcats;

        }
        res.locals.lcCategories = cats;
        next();
    })
}