module.exports = function(app) {
    app.get('/', function (req, res) {
        res.render('vwAdmin/home', { 
          title: 'admin page', 
          layout:'adminmain'});
    })
}