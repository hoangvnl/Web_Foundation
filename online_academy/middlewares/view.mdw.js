const exphbs = require('express-handlebars');
const hbs_sections = require('express-handlebars-sections');
const numeral = require('numeral');
const Handlebars = require("handlebars");
const ratingStar = require('../views/partials/ratingStar.hbs');
const ratingStarUpperCase = require('../views/partials/ratingStarUpperCase.hbs');
const dateFormat = require("dateformat");
Handlebars.registerPartial("ratingStar", ratingStar);
Handlebars.registerPartial("ratingStarUpperCase", ratingStarUpperCase);

Handlebars.registerHelper('compare', function (lvalue, rvalue, options) {

    if (arguments.length < 3)
        throw new Error("Handlerbars Helper 'compare' needs 2 parameters");

    operator = options.hash.operator || "==";

    var operators = {
        '==': function (l, r) { return l == r; },
        '===': function (l, r) { return l === r; },
        '!=': function (l, r) { return l != r; },
        '<': function (l, r) { return l < r; },
        '>': function (l, r) { return l > r; },
        '<=': function (l, r) { return l <= r; },
        '>=': function (l, r) { return l >= r; },
        'typeof': function (l, r) { return typeof l == r; }
    }

    if (!operators[operator])
        throw new Error("Handlerbars Helper 'compare' doesn't know the operator " + operator);

    var result = operators[operator](lvalue, rvalue);

    if (result) {
        return options.fn(this);
    } else {
        return options.inverse(this);
    }

});
Handlebars.registerHelper( "when",function(operand_1, operator, operand_2, options) {
    var operators = {
     'eq': function(l,r) { return l == r; },
     'noteq': function(l,r) { return l != r; },
     'gt': function(l,r) { return Number(l) > Number(r); },
     'or': function(l,r) { return l || r; },
     'and': function(l,r) { return l && r; },
     '%': function(l,r) { return (l % r) === 0; }
    }
    , result = operators[operator](operand_1,operand_2);
  
    if (result) return options.fn(this);
    else  return options.inverse(this);
  });


module.exports = function (app) {
    app.engine('hbs', exphbs({
        defaultLayout: 'main.hbs',
        layoutsDir: 'views/layouts',
        partialsDir: 'views/partials',
        helpers: {
            section: hbs_sections(),
            formatMoney(val) {
                return numeral(val).format('0,0[.]0');
            },
            formatCount(val) {
                return numeral(val).format('0,0');
            },
            formatRate(val) {
                return numeral(val).format('0.0');
            },
            formatDate(val) {
                return dateFormat(val, "longDate");
            }
        }
    }));

    app.set('view engine', 'hbs');
}