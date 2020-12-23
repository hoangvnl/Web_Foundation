const express = require('express');
const exphbs = require('express-handlebars');
const app = express();
app.use(express.urlencoded({
    extended: true
}));
const port = 3000;
app.engine('hbs', exphbs({
    defaultLayout: 'main.hbs'
}));
app.set('view engine', 'hbs');


app.use(require('./middlewares/locals.mdw'));

app.get('/', function (req, res) {
    res.render('home');
});

app.use('/courses', require('./routes/category.route'));


app.use(function (req, res) {
    res.render('404');
})

app.use(function (err, req, res, next) {
    console.error(err.stack)
    res.status(500).send('Something broke!')
})

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})