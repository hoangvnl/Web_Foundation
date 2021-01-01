const db = require('../utils/db');

module.exports = {
    async getNameByCourseID(id) {
        const rows = await db.load(`SELECT p1.LecturerName
        FROM lecturer p1, course_lecturer p2
        WHERE p1.LecturerID = p2.LecturerID and p2.CourseID = ${id}`);

        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].LecturerName;
        }
    },


}