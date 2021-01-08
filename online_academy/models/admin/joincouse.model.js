const db = require('../../utils/db')
const TBL_COURSES = 'course'; 
const TBL_JOINCOURSE = 'joincourse';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_JOINCOURSE}`);
  },

  del(entity) {
    const userid = entity.UserID;
    const courseid = entity.CourseID;
    return db.load(`DELETE FROM ${TBL_JOINCOURSE} WHERE UserID = ${userid} AND CourseID = ${courseid}`); 
  }
}