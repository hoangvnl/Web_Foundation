const db = require('../utils/db');
const TBL_USERS = 'users';

module.exports = {

    all() {
        return db.load(`select * from ${TBL_USERS}`);
    },

    async singleByEmail(email) {
        const rows = await db.load(`select * from ${TBL_USERS} where email = '${email}'`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0];
        }
    },
    async singleByID(id) {
        const rows = await db.load(`select * from ${TBL_USERS} where id = '${id}'`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0];
        }
    },
    verify(entity) {
        db.load(`update ${TBL_USERS} set isverified = 1 where id = ${entity}`)
    },
    add(entity) {
        return db.add(entity, TBL_USERS);
    }

}