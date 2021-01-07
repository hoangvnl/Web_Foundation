const db = require('../../utils/db')
const TBL_LECTURERS = 'lecturer';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_LECTURERS}`);
  },

  del(entity) {
    const condition = {LecturerID: entity.LecturerID};
    return db.del(condition, TBL_LECTURERS); 
  },

  add(entity) {
    return db.add(entity, TBL_LECTURERS); 
  },

  async single(id) {
    const rows = await db.load(`select * from ${TBL_LECTURERS} where LecturerID = ${id}`);
    // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    if(rows.length === 0) {
      return null;
    }
    return rows[0];
  },
  patch(entity) {
    const condition = {LecturerID: entity.LecturerID};
    delete entity.LecturerID;
    return db.patch(entity, condition, TBL_LECTURERS);
  }

//   async getStatus(id) {
//     const rows = await db.load(`select * from ${TBL_LECTURERS} where UserID = ${id}`);
//     // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
//     var user;
//     if(rows.length === 0) {
//       user = null;
//     } else {
//       user = rows[0];
//     }

//     switch(user.Permission) {
//       case 0:
//           return 'Student';
//       case 1:
//           return 'Lecturer';
//       case 2:
//           return 'Admin';
//     }
//   },

//   patch(entity) {
//     const condition = {UserID: entity.UserID};
//     delete entity.UserID;
//     return db.patch(entity, condition, TBL_LECTURERS);
//   }

};