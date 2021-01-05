module.exports = function (app) {
  app.get("/admin", function (req, res) {
    res.render("home", { layout: "admin-main.hbs" });
  });
};
