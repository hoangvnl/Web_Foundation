module.exports = function (app) {
    app.get('/', function (req, res) {
        res.render('home');
    });

    app.use('/courses', require('../routes/category.route'));
    app.use('/join', require('../routes/authentication.route'));

}