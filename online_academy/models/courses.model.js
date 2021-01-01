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

}