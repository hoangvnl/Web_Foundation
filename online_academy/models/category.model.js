const db = require('../utils/db');

module.exports = {
    allWithDetail(id) {
        const sql = `select *
                    from subcategories p 
                    where p.CatID = ${id}`;
        return db.load(sql);
    },
    all() {
        return db.load('select * from categories');
    },
    single(id) {
        return db.load(`select * from categories where CatID = ${id}`);
    },
    singleByName(name) {
        return db.load(`select * from categories where CatName = "${name}"`);
    }

}