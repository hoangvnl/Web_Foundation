const categoryModel = require('../models/category.model');
const cartModel = require('../models/cart.model');

module.exports = function (app) {
    app.use(async function (req, res, next) {
        if (typeof (req.session.isAuth) === 'undefined')
            req.session.isAuth = false;
        if (typeof (req.session.isLecturer) === 'undefined')
            req.session.isLecturer = false;
        if (typeof (req.session.isAdmin) === 'undefined')
            req.session.isAdmin = false;

        res.locals.isAuth = req.session.isAuth;
        res.locals.isLecturer = req.session.isLecturer;
        res.locals.userAuth = req.session.userAuth;

        if (res.locals.isAuth || res.locals.isLecturer) {
            var name = res.locals.userAuth.UserName;
            var shortName;
            var pos = name.lastIndexOf(" ");
            if (pos === -1) {
                shortName = name.substr(0, 1);
            }
            else {
                shortName = name.substr(pos, 2);
            }
            res.locals.userAuth['shortName'] = shortName;
            // console.log(shortName);
        }

        if (typeof (req.session.cart) === 'undefined')
            res.locals.cartCount = 0;
        else {
            res.locals.cartCount = cartModel.count(req.session.cart);
        }
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