const db = require('../../utils/db')
const TBL_COURSES = 'course'; 
const TBL_LECTURER = 'lecturer';
const TBL_COURSE_LECTURER = 'course_lecturer';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_COURSES}`);
  },

  getLecturersByID(id) {
    return db.load(`select * from ${TBL_LECTURER} where LecturerID in (SELECT LecturerID FROM ${TBL_COURSE_LECTURER} WHERE CourseID = ${id})`);
  },

  del(id) {
    const condition = {CourseID: id};
    return db.del(condition, TBL_COURSES); 
  }

};