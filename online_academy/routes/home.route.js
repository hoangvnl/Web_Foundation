const express = require('express');
const lecturerModel = require('../models/lecturer.model');
const ratingModel = require('../models/rating.model');
const subcategoryModel = require('../models/subcategory.model');
const topModel = require('../models/top.model');
const router = express.Router();

router.get('/', async function (req, res) {
    const top10AllCat = await topModel.top10AllCat();
    const top10NewAllCat = await topModel.top10NewAllCat();

    for (var i in top10AllCat) {
        top10AllCat[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(top10AllCat[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(top10AllCat[+i].SubCategoryID);
        top10AllCat[+i]['catName'] = catName;
        var rating = await ratingModel.singleByCourseID(top10AllCat[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        top10AllCat[+i]['rate'] = rate;
    }
    var first4AllCat = [];
    var second4AllCat = [];
    var final2AllCat = [];
    final2AllCat.push(top10AllCat[8]);
    final2AllCat.push(top10AllCat[9]);
    for (i = 0; i <= 3; i++) {
        first4AllCat.push(top10AllCat[i]);
        second4AllCat.push(top10AllCat[i + 4]);
    }


    for (var i in top10NewAllCat) {
        top10NewAllCat[+i]['lecturerName'] = await lecturerModel.getNameByCourseID(top10NewAllCat[+i].CourseID);
        const catName = await subcategoryModel.getNameByID(top10NewAllCat[+i].SubCategoryID);
        top10NewAllCat[+i]['catName'] = catName;
        var rating = await ratingModel.singleByCourseID(top10NewAllCat[+i].CourseID);
        var rate = rating[0].TotalRates / rating[0].TotalVotes;
        top10NewAllCat[+i]['rate'] = rate;
    }
    var first4NewAllCat = [];
    var second4NewAllCat = [];
    var final2NewAllCat = [];
    final2NewAllCat.push(top10NewAllCat[8]);
    final2NewAllCat.push(top10NewAllCat[9]);
    for (i = 0; i <= 3; i++) {
        first4NewAllCat.push(top10NewAllCat[i]);
        second4NewAllCat.push(top10NewAllCat[i + 4]);
    }


    res.render('home', {
        first4AllCat,
        second4AllCat,
        final2AllCat,
        first4NewAllCat,
        second4NewAllCat,
        final2NewAllCat,
    });
});

module.exports = router;