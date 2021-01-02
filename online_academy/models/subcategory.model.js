const db = require('../utils/db');
const TBL_SUBCATEGORY = 'SUBCATEGORY'

module.exports = {
    all() {
        return db.load(`select * from ${TBL_SUBCATEGORY}`);
    },
    single(id) {
        return db.load(`select * from ${TBL_SUBCATEGORY} where SubcategoryID = ${id}`);
    },
    singleByName(name) {
        return db.load(`select * from ${TBL_SUBCATEGORY} where SubcategoryName = "${name}"`);
    },
    async getIDByName(name) {
        const rows = await db.load(`select SubcategoryID from ${TBL_SUBCATEGORY} where SubcategoryName = "${name}"`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].SubcategoryID;
        }
    },
    async getNameByID(id) {
        const rows = await db.load(`select SubcategoryName from ${TBL_SUBCATEGORY} where SubcategoryID = ${id}`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].SubcategoryName;
        }
    },
    searchByName(name) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName
                        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
                        where match(course.CourseName) against ('${name}')
                        or match (subcategory.SubcategoryName) against('${name}')`);

    },

}