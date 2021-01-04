const isAuth = require('./auth.mdw');
module.exports = function (app) {
    app.get('/', function (req, res) {
        res.render('home');
    });
    app.get('/test', function (req, res) {
        res.render('test');
    });
    app.use('/courses', require('../routes/category.route'));
    app.use('/course', require('../routes/course.route'));
    app.use('/join', require('../routes/authentication.route'));
    app.use('/user', require('../routes/user.route'));
    app.use('/cart', isAuth, require('../routes/cart.route'));
    app.use('/lecturer', require('../routes/lecturer.route'));



}