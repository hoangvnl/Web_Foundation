const db = require('../../utils/db')
const TBL_USERS = 'users';

module.exports = {
  all() {
    return db.load(`select * from ${TBL_USERS} where Permission = 0`);
  },

  del(entity) {
    const condition = {UserID: entity.UserID};
    return db.del(condition, TBL_USERS); 
  },

  add(entity) {
    return db.add(entity, TBL_USERS); 
  },

  async single(id) {
    const rows = await db.load(`select * from ${TBL_USERS} where UserID = ${id}`);
    // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    if(rows.length === 0) {
      return null;
    }
    return rows[0];
  },
  patch(entity) {
    const condition = {UserID: entity.UserID};
    delete entity.UserID;
    return db.patch(entity, condition, TBL_USERS);
  }

};