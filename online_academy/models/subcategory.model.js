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
    }
}