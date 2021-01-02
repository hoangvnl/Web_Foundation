const db = require('../utils/db');

module.exports = {
    allWithCourseID(id) {
        return db.load(`SELECT *
                        FROM course_content
                        WHERE CourseID =  ${id}`);
    },


}