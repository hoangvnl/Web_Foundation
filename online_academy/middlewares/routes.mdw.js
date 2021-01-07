const isAuth = require("./auth.mdw");
const isLecturer = require('./lecturer.mdw');
module.exports = function (app) {
  app.get("/test", function (req, res) {
    res.render("test");
  });
  app.use("/courses", require("../routes/category.route"));
  app.use('/course', require("../routes/course.route"));
  app.use("/join", require("../routes/authentication.route"));
  app.use("/user", require("../routes/user.route"));
  app.use("/cart", isAuth, require("../routes/cart.route"));
  app.use("/lecturer", require("../routes/lecturer.route"));
  app.use("/khoa", require("../routes/khoa.route"));
  app.use('/admin', require('../routes/admin.route'));
  app.use('/admin/categories', require('../routes/admin/category.route'));
  app.use('/admin/subcategories', require('../routes/admin/subcategory.route'));
  app.use('/admin/courses', require('../routes/admin/course.route'));

  app.use('/', require('../routes/home.route'));
};
