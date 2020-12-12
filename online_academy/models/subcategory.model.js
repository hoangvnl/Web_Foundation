const db = require('../utils/db');

module.exports = {
    all() {
        return db.load('select * from subcategories');
    },
    single(id) {
        return db.load(`select * from subcategories where SubCatID = ${id}`);
    }
}