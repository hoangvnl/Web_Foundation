const db = require('../utils/db');
const TBL_WATCHEDLECTURE = 'watched_lecture';

module.exports = {
    add(entity) {
        return db.add(entity, TBL_WATCHEDLECTURE);
    },
    allByUserIDAndCourseID(UserID, CourseID) {
        return db.load(`select * from ${TBL_WATCHEDLECTURE} where UserID= ${UserID} and CourseID = ${CourseID}`)
    },
    async checkIsWatched(lectureID) {
        var rows = await db.load(`select * from ${TBL_WATCHEDLECTURE} 
                                  where CurrentLecture = ${lectureID}`);
        if (rows.length > 0) return true;
        return false;
    }
}