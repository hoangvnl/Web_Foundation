const db = require('../utils/db');
const TBL_LECTURER = 'lecturer';

module.exports = {
    singleByName(name) {
        return db.load(`select * from lecturer where LecturerName = "${name}"`);
    },
    singleByUserID(id) {
        return db.load(`select * from lecturer where UserID = "${id}"`);
    },
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
    async countStudent(id) {
        const rows = await db.load(`select sum(c.StudentCount) as studentcount from course c where c.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '${id}')`);
        return rows[0].studentcount;
    },
    async countReview(id) {
        const rows = await db.load(`select sum(r.TotalVotes) as totalreviews from rating r where r.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '${id}')`);
        return rows[0].totalreviews;
    },
    async countCourse(id) {
        const rows = await db.load(`select count(cl.CourseID) as coursecount from course_lecturer cl where cl.LecturerID = '${id}'`);
        return rows[0].coursecount;
    },
    async countRating(id) {
        const rows = await db.load(`select round((sum(r.TotalRates) / sum(r.TotalVotes)),1) as ratings from rating r where r.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '${id}')`);
        return rows[0].ratings;
    },
    patch(entity) {
        const condition = { LecturerID: entity.LecturerID };
        delete entity.LecturerID;
        return db.patch(entity, condition, TBL_LECTURER);
    },

}