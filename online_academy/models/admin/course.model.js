const db = require('../../utils/db')
const TBL_COURSES = 'course'; 
const TBL_LECTURER = 'lecturer';
const TBL_COURSE_LECTURER = 'course_lecturer';
const TBL_JOINCOURSE = 'joincourse';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_COURSES}`);
  },

  allBySubcategory(subID) {
    return db.load(`select * from ${TBL_COURSES} where SubCategoryID = ${subID}`);
  },

  getLecturersByID(id) {
    return db.load(`select * from ${TBL_LECTURER} where LecturerID in (SELECT LecturerID FROM ${TBL_COURSE_LECTURER} WHERE CourseID = ${id})`);
  },

  del(id) {
    const condition = {CourseID: id};
    return db.del(condition, TBL_COURSES); 
  },

  getAllByLecturerID(id) {
    return db.load(`SELECT * from ${TBL_COURSES} where CourseID in (SELECT CourseID FROM ${TBL_COURSE_LECTURER} where LecturerID = ${id})
    `)
  },

  getAllByUserID(id) {
    return db.load(`select * from ${TBL_COURSES} where CourseID in (select CourseID from ${TBL_JOINCOURSE} where UserID = ${id})`);
  },

  patch(entity) {
    const condition = {CourseID: entity.CourseID};
    delete entity.CourseID;
    return db.patch(entity, condition, TBL_COURSES);
  }

};