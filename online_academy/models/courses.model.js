const db = require('../utils/db');
const TBL_COURSE = 'course';

module.exports = {
    allWithSubCatID(id) {
        return db.load(`select * from ${TBL_COURSE} where SubCategoryID = ${id}`);
    },
    allWithCatID(id) {
        return db.load(`SELECT *
        FROM ${TBL_COURSE} 
        WHERE SubcategoryID  IN (SELECT SubcategoryID
            FROM subcategory
            WHERE CategoryID = ${id});`);
    },
    allInWishlistByUserID(id) {
        return db.load(`select p2.*
                        from wishlist p1, course p2
                        where p1.UserID = ${id} and p2.CourseID = p1.CourseID`);
    },
    singleByName(name) {
        return db.load(`SELECT *
        FROM ${TBL_COURSE} 
        WHERE CourseName = '${name}';`);
    },

}