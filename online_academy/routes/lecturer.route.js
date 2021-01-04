const express = require('express');
const router = express.Router();
const multer = require('multer');

router.get('/upload', function (req, res) {
    res.render('vwLecturer/upload')
})
router.post('/upload', function (req, res) {
    console.log(req.body);
    console.log(1 + 1);
    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, './public/imgs/')
        },
        filename: function (req, file, cb) {
            cb(null, file.originalname)
        }
    });
    const upload = multer({ storage });
    // upload.single('fuMain')(req, res, function (err) {
    upload.array('fuMain', 3)(req, res, function (err) {
        if (err) {

        } else {
            res.render('vwLecturer/upload');
        }
    });
    res.render('vwLecturer/upload');
})

module.exports = router;