const db = require('../utils/db');
const TBL_COURSE = 'course';
const config = require('../config/default.json');

module.exports = {
    allWithSubCatID(id) {
        return db.load(`select * from ${TBL_COURSE} where SubCategoryID = ${id}`);
    },
    async countAllWithSubCatID(id) {
        const rows = await db.load(`select count(*) as total from ${TBL_COURSE} where SubCategoryID = ${id}`);
        return rows[0].total;
    },
    pageWithSubCatID(id, offset) {
        return db.load(`select * from ${TBL_COURSE} where SubCategoryID = ${id} limit ${config.pagination.limit} offset  ${offset}`);
    },
    allWithCatID(id) {
        return db.load(`SELECT *
        FROM ${TBL_COURSE} 
        WHERE SubcategoryID  IN (SELECT SubcategoryID
            FROM subcategory
            WHERE CategoryID = ${id});`);
    },
    async countAllWithCatID(id) {
        const rows = await db.load(`select count (*) as total
            FROM ${TBL_COURSE} 
            WHERE SubcategoryID  IN (SELECT SubcategoryID
            FROM subcategory
            WHERE CategoryID = ${id});`);
        return rows[0].total;
    },
    pageWithCatID(id, offset) {
        return db.load(`SELECT *
        FROM ${TBL_COURSE} 
        WHERE SubcategoryID  IN (SELECT SubcategoryID
            FROM subcategory
            WHERE CategoryID = ${id}) limit ${config.pagination.limit} offset ${offset}`);
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