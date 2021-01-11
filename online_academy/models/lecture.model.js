const db = require('../utils/db');
const TBL_LECTURE = 'lecture';

module.exports = {
    allWithContentID(id) {
        return db.load(`SELECT *
        FROM ${TBL_LECTURE}
        WHERE ContentID =  ${id}`);
    },
    delAllByContentID(id) {
        return db.load(`DELETE 
        FROM  ${TBL_LECTURE}
        WHERE ContentID = ${id}`);
    },
    add(entity) {
        return db.add(entity, TBL_LECTURE);
    },
    patch(entity) {
        const condition = { LectureID: entity.LectureID };
        delete entity.LectureID;
        return db.patch(entity, condition, TBL_LECTURE);
    },
    del(entity) {
        const condition = { LectureID: entity.LectureID };
        return db.del(condition, TBL_LECTURE);
    },

}