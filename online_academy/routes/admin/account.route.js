const express = require('express');
const router = express.Router();
const accountModel = require('../../models/admin/account.model');
const lecturerModel = require('../../models/admin/lecturer.model');
const bcrypt = require('bcryptjs');

router.get('/', async function (req, res) {
    const rows = await accountModel.all();

    //xu li permission
    let students = [];
    let lecturers = [];
    let admins = [];
    for (var i = 0; i < rows.length; i++) {
        const permission = rows[i]['Permission'];
        if (permission == 0) {
            students.push(rows[i]);
        } else if (permission == 1) {
            lecturers.push(rows[i]);
        } else {
            admins.push(rows[i]);
        }
    }

    res.locals.lcIsAccounts = true;
    res.render('vwAdmin/vwAccounts/index', {
        title: 'adminaccounts',
        layout: 'adminmain',
        students,
        lecturers,
        admins,
        sempty: students.length === 0,
        lempty: lecturers.length === 0,
        aempty: admins.length === 0
    });
})

// add
router.get('/add', async function (req, res) {
    res.locals.lcIsAccounts = true;
    res.render('vwAdmin/vwAccounts/add', {
        title: 'adminaccounts',
        layout: 'adminmain'
    });
})
router.post('/add', async function (req, res) {
    res.locals.lcIsAccounts = true;


    // const catRows = await categoryModel.all();
    req.body['Verification'] = '1';
    req.body.Password = bcrypt.hashSync(req.body.Password, 7);
    const ret = await accountModel.add(req.body);


    //if lecturer
    if (req.body['Permission'] == '1') {
        const rows = await accountModel.all();
        console.log(rows[rows.length - 1]);
        var lecturer = {};
        lecturer['UserID'] = rows[rows.length - 1].UserID;
        lecturer['LecturerName'] = rows[rows.length - 1].UserName;
        const ret2 = await lecturerModel.add(lecturer);
    }


    res.render('vwAdmin/vwAccounts/add', {
        title: 'adminaccounts',
        layout: 'adminmain'
    });
});

// edit
router.get("/:id", async function (req, res) {
    const id = req.params.id;
    const account = await accountModel.single(id);
    if (account === null) {
        return res.redirect("/admin/accounts");
    }

    account['current_permission'] = await accountModel.getStatus(id);
    // console.log(account);
    res.locals.lcIsAccounts = true;
    res.render("vwAdmin/vwAccounts/edit", {
        title: 'adminaccounts',
        layout: 'adminmain',
        account
    });
});

// del
router.post("/del", async function (req, res) {
    delete req.body.CurrentPermission;
    const ret = await accountModel.del(req.body);
    res.redirect("/admin/accounts");
});

//update
router.post("/patch", async function (req, res) {

    const account = req.body;
    delete account.CurrentPermission;

    if (account['isRePass'] == 'true') {
        account['Password'] = '1234';
        account['Password'] = bcrypt.hashSync(account['Password'], 7);
    }
    // delete account.CourseID;
    delete account.isRePass;
    const ret = await accountModel.patch(account);
    res.redirect("/admin/accounts");
});

//lock
router.post("/lock", async function (req, res) {
    // console.log(req.body);
    const account = {
        UserID: req.body.UserID,
        isLocked: '1'
    };
    // console.log(account);
    const ret = await accountModel.patch(account);

    res.redirect("/admin/accounts");
})
//unlock account
router.post("/unlock", async function (req, res) {
    // console.log(req.body);
    const account = {
        UserID: req.body.UserID,
        isLocked: '0'
    };
    // console.log(account);
    const ret = await accountModel.patch(account);

    res.redirect("/admin/accounts");
})


module.exports = router;