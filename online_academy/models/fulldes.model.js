const db = require('../utils/db');
const TBL_FULLDES = 'FULLDES'

module.exports = {
    allByCourseID(id) {
        return db.load(`select * from ${TBL_FULLDES} where CourseID = ${id}`);
    }

}