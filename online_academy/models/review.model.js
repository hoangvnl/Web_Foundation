const db = require('../utils/db');
const TBL_REVIEW = 'review'

module.exports = {
    add(entity) {
        return db.add(entity, TBL_REVIEW);
    },
    allByCourseID(id) {
        return db.load(`select * from ${TBL_REVIEW} where CourseID = ${id}`);
    },
    async getReviewIfReviewed(UserID, CourseID) {
        const rows = await db.load(`select * from ${TBL_REVIEW} where UserID = ${UserID} and CourseID = ${CourseID}`)
        if (rows.length > 0) return rows[0];
        else return null;
    }

}