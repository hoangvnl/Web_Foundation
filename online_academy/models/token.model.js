const db = require('../utils/db');
const TBL_TOKENS = 'tokens';

module.exports = {

    async singleByToken(token) {
        const rows = await db.load(`select * from ${TBL_TOKENS} where token = '${token}'`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0];
        }
    },
    add(entity) {
        return db.add(entity, TBL_TOKENS);
    }

}