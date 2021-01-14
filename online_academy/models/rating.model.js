const db = require('../utils/db');
const TBL_RATING = 'rating';

module.exports = {
    singleByCourseID(id) {
        return db.load(`SELECT *
        FROM rating
        WHERE CourseID =  ${id}`);
    },
    patch(entity) {
        const condition = { CourseID: entity.CourseID };
        delete entity.CourseID;
        return db.patch(entity, condition, TBL_RATING);
    },
    add(entity) {
        return db.add(entity, TBL_RATING);
    },

}