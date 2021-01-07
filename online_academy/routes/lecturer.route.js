const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const dateFormat = require("dateformat");
const contentModel = require('../models/content.model');
const coursesModel = require('../models/courses.model');
const course_lecturerModel = require('../models/course_lecturer.model');
const lectureModel = require('../models/lecture.model');
const lecturerModel = require('../models/lecturer.model');

var now = new Date();

const storageImage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/images')
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
});
const storageVideo = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/videos')
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
});
const uploadImage = multer({ storage: storageImage });
const uploadVideo = multer({ storage: storageVideo });
var fields = [];

router.get('/', function (req, res) {
    res.redirect('/lecturer/course');
})

router.get('/course', async function (req, res) {
    const user = req.session.userAuth;

    const course = await coursesModel.allByLecturerID(user.LecturerID);
    res.render('vwLecturer/Course/course', {
        layout: 'lecturer',
        course
    });
})

router.get('/course/create', function (req, res) {
    res.render('vwLecturer/Course/create');
})

router.post('/course/create', async function (req, res) {
    console.log(req.body);
    //CourseName, Subcategory
    var entity = req.body;
    entity['Description'] = '';
    entity['CreatedAt'] = dateFormat(now, 'isoDate');
    console.log(entity);
    await coursesModel.add(entity);
    var course = await coursesModel.singleByName(entity.CourseName);
    var newEntity = { CourseID: course[0].CourseID, LecturerID: req.session.userAuth.LecturerID };
    await course_lecturerModel.add(newEntity);
    console.log(entity.CourseName);
    // const course = coursesModel.singleByName(req.body.CourseName);
    res.redirect('/lecturer/course/' + entity.CourseName + '/basic');
})

router.get('/course/:param/basic', async function (req, res) {
    const param = req.params.param;
    const url = req.originalUrl.slice(0, req.originalUrl.length - 6);
    const course = await coursesModel.singleByName(param);
    res.render('vwLecturer/Course/basic', {
        course,
        url
    })
})

router.get('/course/:param/curriculum', async function (req, res) {
    const param = req.params.param;
    const url = req.originalUrl.slice(0, req.originalUrl.length - 11);
    const course = await coursesModel.singleByName(param);
    const content = await contentModel.allWithCourseID(course[0].CourseID);
    for (var i in content) {
        content[i]['lecture'] = await lectureModel.allWithContentID(content[i].ContentID);
    }
    res.render('vwLecturer/Course/curriculum', {
        course,
        content,
        url
    })
})


router.post('/course/:param/curriculum', async function upLoadVideoFunc(req, res) {
    const param = req.params.param;
    var num = +req.query.num;
    console.log(num);
    for (i = 1; i < num; i++) {
        fields.push({ name: 'LectureVideo' + i, maxCount: 10 });
    }

    uploadVideo.fields(fields)(req, res, function (err) {
        if (err) {
            res.send(err);
        } else {
            console.log(req.body);
            for (i = 1; i <= fields.length; i++) {
                console.log(req.files['LectureVideo' + i]);
            }

        }
    })


    var num = 0;
    var contentName = req.body.ContentName;
    for (var i in contentName) {
        var lectureTemp = req.body['LectureName' + i];
        if (lectureTemp.length === 0) num++;
        else {
            for (var j = 0; j < lectureTemp.length; j++) {
                num++;
            }
        }

    }
    const pos = req.originalUrl.indexOf('?num=');
    const url = req.originalUrl.slice(0, pos - 11);
    const course = await coursesModel.singleByName(param);
    const content = await contentModel.allWithCourseID(course[0].CourseID);
    for (var i in content) {
        content[i]['lecture'] = await lectureModel.allWithContentID(content[i].ContentID);
    }
    res.render('vwLecturer/Course/curriculum', {
        course,
        content,
        url
    })


})
router.post('/course/:param/basic', async function (req, res) {
    uploadImage.single('CourseImage')(req, res, async function (err) {
        if (err) {
            res.send(err);
        }
        else {
            const param = req.params.param;
            var course = await coursesModel.singleByName(param);
            var courseTemp = req.body;
            courseTemp['CourseID'] = course[0].CourseID;
            if (typeof (req.file) === 'undefined') {
                console.log('undefined');
            }
            else {
                courseTemp['CourseImage'] = req.file.path.slice(7);
            }
            await coursesModel.patch(courseTemp);
            course = await coursesModel.singleByName(courseTemp.CourseName);
            res.redirect('/lecturer/course/' + courseTemp.CourseName + '/basic')
        }
    })


})



module.exports = router;