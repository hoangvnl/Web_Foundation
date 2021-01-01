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
    },
    async getIDByName(name) {
        const rows = await db.load(`select CategoryID from ${TBL_CATEGORY} where CategoryName = "${name}"`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].CategoryID;
        }
    }

}