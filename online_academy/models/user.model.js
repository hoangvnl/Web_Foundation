const db = require('../utils/db');
const TBL_USERS = 'USERS';

module.exports = {

    all() {
        return db.load(`select * from ${TBL_USERS}`);
    },

    async singleByEmail(email) {
        const rows = await db.load(`select * from ${TBL_USERS} where Email = '${email}'`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0];
        }
    },
    async singleByID(id) {
        const rows = await db.load(`select * from ${TBL_USERS} where UserID = ${id}`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0];
        }
    },
    verify(entity) {
        db.load(`update ${TBL_USERS} set Verification = 1 where UserID = ${entity}`)
    },
    add(entity) {
        return db.add(entity, TBL_USERS);
    },
    patch(entity) {
        const condition = { UserID: entity.UserID };
        delete entity.UserID;
        return db.patch(entity, condition, TBL_USERS);
    },

}