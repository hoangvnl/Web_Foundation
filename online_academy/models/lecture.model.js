const db = require('../utils/db');

module.exports = {
    allWithContentID(id) {
        return db.load(`SELECT *
        FROM lecture
        WHERE ContentID =  ${id}`);
    },


}