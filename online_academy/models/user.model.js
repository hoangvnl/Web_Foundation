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
    add(entity) {
        return db.add(entity, TBL_USERS);
    }

}