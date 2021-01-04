module.exports = function isLecturer(req, res, next) {
    if (req.session.isLecturer === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/join/login');
    }

    next();
}