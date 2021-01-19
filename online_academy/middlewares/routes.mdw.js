const isAuth = require("./auth.mdw");
const isLecturer = require('./lecturer.mdw');
const isAdmin = require('./admin.mdw');
module.exports = function (app) {
  app.use("/courses", require("../routes/category.route"));
  app.use('/course', require("../routes/course.route"));
  app.use("/join", require("../routes/authentication.route"));
  app.use("/user", require("../routes/user.route"));
  app.use("/cart", isAuth, require("../routes/cart.route"));
  app.use("/lecturer", isLecturer, require("../routes/lecturer.route"));


  // admin
  app.use('/admin', isAdmin, require('../routes/admin.route'));
  app.use('/admin/categories', isAdmin, require('../routes/admin/category.route'));
  app.use('/admin/subcategories', isAdmin, require('../routes/admin/subcategory.route'));
  app.use('/admin/courses', isAdmin, require('../routes/admin/course.route'));
  app.use('/admin/accounts', isAdmin, require('../routes/admin/account.route'));
  app.use('/admin/lecturers', isAdmin, require('../routes/admin/lecturer.route'));
  app.use('/admin/students', isAdmin, require('../routes/admin/student.route'));


  app.use('/', require('../routes/home.route'));
};
