module.exports = function isAdmin(req, res, next) {
    if (req.session.isAdmin === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/join/login');
    }

    next();
}