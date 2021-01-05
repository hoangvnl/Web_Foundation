const express = require('express');
const router = express.Router();
const multer = require('multer');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
});
const upload = multer({ storage });

router.get('/course', function (req, res) {
    res.render('vwLecturer/course');
})

router.get('/upload', function (req, res) {
    res.render('vwLecturer/upload')
})
router.post('/upload', function (req, res) {

    upload.single('LectureVideo')(req, res, function (err) {
        if (err) {
            res.send(err);
        } else {
            console.log(req.body);
            res.render('vwLecturer/upload');
        }
    });

})

module.exports = router;