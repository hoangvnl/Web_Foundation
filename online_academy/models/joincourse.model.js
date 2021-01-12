const db = require('../utils/db');
const TBL_JOINCOURSE = 'joincourse';

module.exports = {
    add(entity) {
        return db.add(entity, TBL_JOINCOURSE);
    },
    allByUserID(id) {
        return db.load(`select * from ${TBL_JOINCOURSE} where UserID = ${id}`)
    },


}