const db = require('../../utils/db')
const TBL_ACCOUNTS = 'users';
const TBL_LECTURER = 'lecturer';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_ACCOUNTS}`);
  },

  del(entity) {
    const condition = {UserID: entity.UserID};
    return db.del(condition, TBL_ACCOUNTS); 
  },

  add(entity) {
    return db.add(entity, TBL_ACCOUNTS); 
  },

  async single(id) {
    const rows = await db.load(`select * from ${TBL_ACCOUNTS} where UserID = ${id}`);
    // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    if(rows.length === 0) {
      return null;
    }
    return rows[0];
  },

  async getStatus(id) {
    const rows = await db.load(`select * from ${TBL_ACCOUNTS} where UserID = ${id}`);
    // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    var user;
    if(rows.length === 0) {
      user = null;
    } else {
      user = rows[0];
    }

    switch(user.Permission) {
      case 0:
          return 'Student';
      case 1:
          return 'Lecturer';
      case 2:
          return 'Admin';
    }
  },

  patch(entity) {
    const condition = {UserID: entity.UserID};
    delete entity.UserID;
    return db.patch(entity, condition, TBL_ACCOUNTS);
  },

  getAvailableLecturer() {
    return db.load(`SELECT * FROM ${TBL_ACCOUNTS} where UserID not in (select UserID from ${TBL_LECTURER}) and Permission = 1`);
  }

};