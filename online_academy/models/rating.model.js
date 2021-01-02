const db = require('../utils/db');

module.exports = {
    singleByCourseID(id) {
        return db.load(`SELECT *
        FROM rating
        WHERE CourseID =  ${id}`);
    },


}