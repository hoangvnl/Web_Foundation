const mysql = require('mysql');
const util = require('util')
var pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'my_db'
});

const pool_query = util.promisify(pool.query).bind(pool);

module.exports = {
    load(sql) {
        return pool_query(sql);
    },
    add: (entity, tableName) => pool_query(`insert into ${tableName} set ?`, entity),


}