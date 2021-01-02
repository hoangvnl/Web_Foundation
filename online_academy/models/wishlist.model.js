const db = require('../utils/db');
const TBL_WISHLIST = 'wishlist';

module.exports = {
    async singleByUserID(id) {
        return db.load(`select * from ${TBL_WISHLIST} where UserID = '${id}'`);
    },
    add(entity) {
        return db.add(entity, TBL_WISHLIST);
    },
    del(entity) {
        const condition = { CourseID: entity.CourseID };
        return db.del(condition, TBL_WISHLIST);
    },
    async checkWishlist(userID, courseID) {
        const rows = await db.load(`select * from ${TBL_WISHLIST} where UserID = ${userID} and CourseID = ${courseID}`);
        if (rows.length === 0) {
            return false;
        }
        else {
            return true;
        }
    }

}