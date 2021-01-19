const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const dateFormat = require("dateformat");
const bcrypt = require('bcryptjs');
const contentModel = require('../models/content.model');
const coursesModel = require('../models/courses.model');
const course_lecturerModel = require('../models/course_lecturer.model');
const lectureModel = require('../models/lecture.model');
const lecturerModel = require('../models/lecturer.model');
const userModel = require('../models/user.model');
const ratingModel = require('../models/rating.model');

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
    res.render('vwLecturer/Course/create', {
        layout: 'lecturer',
    });
})

router.post('/course/create', async function (req, res) {
    console.log(req.body);
    //CourseName, Subcategory
    var entity = req.body;
    entity['Description'] = '';
    entity['CreatedAt'] = dateFormat(now, 'isoDate');
    entity['UpdatedAt'] = entity.CreatedAt;
    entity['isCompleted'] = 0;
    entity['isDisabled'] = 0;
    console.log(entity);
    await coursesModel.add(entity);
    var course = await coursesModel.singleByName(entity.CourseName);
    var newEntity = { CourseID: course[0].CourseID, LecturerID: req.session.userAuth.LecturerID };
    await course_lecturerModel.add(newEntity);
    console.log(entity.CourseName);
    var entityRating = { CourseID: course[0].CourseID, TotalVotes: 0, TotalRates: 0 };
    await ratingModel.add(entityRating);
    // const course = coursesModel.singleByName(req.body.CourseName);
    res.redirect('/lecturer/course/' + entity.CourseName + '/basic');
})

router.get('/course/:param/basic', async function (req, res) {
    const param = req.params.param;
    const url = req.originalUrl.slice(0, req.originalUrl.length - 6);
    const course = await coursesModel.singleByName(param);
    res.render('vwLecturer/Course/basic', {
        course,
        url,
        layout: 'lecturer',
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
    console.log(course);
    res.render('vwLecturer/Course/curriculum', {
        course,
        content,
        url,
        layout: 'lecturer',
    })
})


router.post('/course/:param/curriculum', async function upLoadVideoFunc(req, res) {
    var num = +req.query.num;
    var fields = [];
    console.log('num = ' + num);
    for (i = 1; i < num; i++) {
        fields.push({ name: 'LectureVideo' + i, maxCount: 10 });
    }

    uploadVideo.fields(fields)(req, res, async function (err) {
        if (err) {
            res.send(err);
        } else {
            var param = req.params.param;
            var course = await coursesModel.singleByName(param);
            if (req.body.Completed == 1) {
                var entityCourse = { CourseID: course[0].CourseID, isCompleted: 1 };
                await coursesModel.patch(entityCourse);
            }
            var curContent = await contentModel.allWithCourseID(course[0].CourseID);
            // console.log(curContent);
            var contentName = req.body.ContentName;
            // console.log('contentName:');
            // console.log(contentName);
            //delete các lecture hiện tại theo ContentID
            console.log('fields = ' + fields.length);

            console.log('video dau');
            for (i = 1; i <= fields.length; i++) {
                console.log('LectureVideo' + i + ' ' + req.files['LectureVideo' + i]);
            }

            var videoCountTempGetLink = 0;
            for (i = 0; i < curContent.length; i++) {
                var lectureTempGetLink = await lectureModel.allWithContentID(curContent[i].ContentID);

                for (j = 0; j < lectureTempGetLink.length; j++) {
                    videoCountTempGetLink++;
                    console.log(videoCountTempGetLink);
                    // log
                    if (lectureTempGetLink[j].VideoLink != null) {
                        while (typeof (req.files['LectureVideo' + videoCountTempGetLink]) !== 'undefined') {
                            videoCountTempGetLink++;
                        }
                        req.files['LectureVideo' + videoCountTempGetLink] = {};
                        req.files['LectureVideo' + videoCountTempGetLink]['filename'] = lectureTempGetLink[j].VideoLink;
                    }
                }



                // for (j = 0; j < lectureTempGetLink.length; j++) {
                //     videoCountTempGetLink++;
                //     console.log(videoCountTempGetLink);
                //     // log
                //     if (lectureTempGetLink[j].VideoLink != null && typeof (req.files['LectureVideo' + videoCountTempGetLink]) === 'undefined') {
                //         req.files['LectureVideo' + videoCountTempGetLink] = {};
                //         req.files['LectureVideo' + videoCountTempGetLink]['filename'] = lectureTempGetLink[j].VideoLink;
                //     }
                // }

                await lectureModel.delAllByContentID(curContent[i].ContentID);
            }
            console.log('fields: ' + fields.length);
            console.log('video sau');
            for (i = 1; i <= fields.length; i++) {
                console.log('LectureVideo' + i + ' ' + req.files['LectureVideo' + i]);
            }

            //delete các content hiện tại theo CourseID
            await contentModel.delAllByCourseID(course[0].CourseID);

            //thêm mới content theo CourseID
            for (i = 1; i < contentName.length; i++) {
                await contentModel.add({ ContentName: contentName[i], CourseID: course[0].CourseID });
            }
            var videoNum = 0;
            // console.log('reqbody');
            // console.log(req.body)
            //thêm các lecture theo ContentID
            for (i = 1; i < contentName.length; i++) {
                //i = 1 2 3 
                var content = await contentModel.singleByNameAndCourseID(contentName[i], course[0].CourseID);
                // console.log('content');
                // console.log(content);
                // console.log(req.body);
                var lecture = req.body['LectureName' + i];
                if (typeof (lecture) === 'undefined') {
                    lecture = '';
                    await lectureModel.add({ LectureName: lecture, ContentID: content.ContentID });
                }
                else if (typeof (lecture) === 'string') {
                    for (j = 0; j < 1; j++) {

                        var Preview = 0;
                        if (req.body['Preview' + i] === 'true') Preview = 1;

                        var VideoLink = null;
                        videoNum++;
                        if (typeof (req.files['LectureVideo' + videoNum]) !== 'undefined') {
                            if (typeof (req.files['LectureVideo' + videoNum][0]) === 'undefined') {

                                VideoLink = req.files['LectureVideo' + videoNum].filename;
                            }
                            else {
                                VideoLink = req.files['LectureVideo' + videoNum][0].filename;
                            }
                        }
                        // console.log('entity');
                        // console.log(lecture);
                        // console.log(content.ContentID);
                        // console.log(Preview);
                        // console.log(VideoLink);
                        await lectureModel.add({ LectureName: lecture, ContentID: content.ContentID, Preview, VideoLink });
                    }
                }
                else {
                    for (j = 0; j < lecture.length; j++) {
                        var Preview = 0;
                        if (req.body['Preview' + i][j] === 'true') Preview = 1;
                        // console.log(req.body['Preview' + i]);
                        var VideoLink = null;
                        videoNum++;
                        if (typeof (req.files['LectureVideo' + videoNum]) !== 'undefined') {
                            if (typeof (req.files['LectureVideo' + videoNum][0]) === 'undefined') {

                                VideoLink = req.files['LectureVideo' + videoNum].filename;
                            }
                            else {
                                VideoLink = req.files['LectureVideo' + videoNum][0].filename;
                            }
                        }
                        // console.log('entity');
                        // console.log(lecture[j]);
                        // console.log(content.ContentID);
                        // console.log(Preview);
                        // console.log(VideoLink);
                        await lectureModel.add({ LectureName: lecture[j], ContentID: content.ContentID, Preview, VideoLink });
                    }
                }
            }

            // for (i = 1; i <= fields.length; i++) {
            //     if (typeof (req.files['LectureVideo' + i]) !== 'undefined') {

            //         console.log(req.files['LectureVideo' + i][0].filename);
            //     }

            // }
            const pos = req.originalUrl.indexOf('?num=');
            const url = req.originalUrl.slice(0, pos - 11);
            course = await coursesModel.singleByName(param);
            entity = { CourseID: course[0].CourseID, UpdatedAt: dateFormat(now, 'isoDate') };
            await coursesModel.patch(entity);
            content = await contentModel.allWithCourseID(course[0].CourseID);
            for (var i in content) {
                content[i]['lecture'] = await lectureModel.allWithContentID(content[i].ContentID);
            }
            res.render('vwLecturer/Course/curriculum', {
                course,
                content,
                url,
                layout: 'lecturer',
            })
        }
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

router.get('/edit-profile', function (req, res) {
    var user = req.session.userAuth;
    res.render('vwLecturer/Profile/editProfile', {
        layout: 'lecturer',
        id: user.UserID,
        email: user.Email,
        userName: user.UserName
    });
})

router.post('/name', async function (req, res) {
    const id = req.session.userAuth.UserID;
    var entity = { LecturerID: req.session.userAuth.LecturerID, LecturerName: req.body.UserName };
    await lecturerModel.patch(entity);
    var newEntity = { UserID: id, UserName: req.body.UserName };
    await userModel.patch(newEntity);
    var user = await userModel.singleByID(id);
    var lecturer = await lecturerModel.singleByUserID(req.session.userAuth.UserID);
    user['LecturerID'] = lecturer[0].LecturerID;
    user['LecturerName'] = lecturer[0].LecturerName;
    req.session.userAuth = user;
    res.redirect('/lecturer/edit-profile');
})
router.post('/email', async function (req, res) {
    console.log(req.body);
    const id = req.session.userAuth.UserID;
    await userModel.patch(req.body);
    var user = await userModel.singleByID(id);
    var lecturer = await lecturerModel.singleByUserID(req.session.userAuth.UserID);
    user['LecturerID'] = lecturer[0].LecturerID;
    user['LecturerName'] = lecturer[0].LecturerName;
    req.session.userAuth = user;
    res.redirect('/lecturer/edit-profile');
})
router.post('/password', async function (req, res) {
    const id = req.session.userAuth.UserID;
    req.body.Password = bcrypt.hashSync(req.body.Password, 7);
    await userModel.patch(req.body);
    var user = await userModel.singleByID(id);
    var lecturer = await lecturerModel.singleByUserID(req.session.userAuth.UserID);
    user['LecturerID'] = lecturer[0].LecturerID;
    user['LecturerName'] = lecturer[0].LecturerName;
    req.session.userAuth = user;
    res.redirect('/lecturer/edit-profile');
})

router.get('/is-right', async function (req, res) {
    const id = req.query.id;
    const password = req.query.password;
    const user = await userModel.singleByID(id);
    const ret = bcrypt.compareSync(password, user.Password);
    if (ret === false) {
        return res.json(false);
    }
    else {
        return res.json(true);
    }
})

router.get('/is-right-course-name', async function (req, res) {
    const name = req.query.name;
    var rows = await coursesModel.singleByName(name);
    console.log(rows.length);
    if (rows.length > 0) {
        console.log(false);
        return res.json(false);
    }
    else {
        console.log(true);
        return res.json(true);
    }
})


module.exports = router;