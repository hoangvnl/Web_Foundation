module.exports = function isAuth(req, res, next) {
  if (req.session.isAuth === false) {
    req.session.retUrl = req.originalUrl;
    return res.redirect('/join/login');
  }

  next();
}