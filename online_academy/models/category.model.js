const db = require('../utils/db');
const TBL_CATEGORY = 'CATEGORY'

module.exports = {
    allWithDetail(id) {
        const sql = `select *
                    from SUBCATEGORY p 
                    where p.CategoryID = ${id}`;
        return db.load(sql);
    },
    all() {
        return db.load(`select * from ${TBL_CATEGORY}`);
    },
    single(id) {
        return db.load(`select * from ${TBL_CATEGORY} where CategoryID = ${id}`);
    },
    singleByName(name) {
        return db.load(`select * from ${TBL_CATEGORY} where CategoryName = "${name}"`);
    }

}