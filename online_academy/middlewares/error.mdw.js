module.exports = function (app) {
    app.use(function (req, res) {
        res.render('404');
    });

    app.use(function (err, req, res, next) {
        console.error(err.stack)
        res.status(500).send('Something broke!')
    })
}