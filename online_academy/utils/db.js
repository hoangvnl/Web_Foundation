const mysql = require("mysql");
const util = require("util");
var pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "1234",
  database: "online_academy",
});

const pool_query = util.promisify(pool.query).bind(pool);

module.exports = {
  load(sql) {
    return pool_query(sql);
  },
  add: (entity, tableName) =>
    pool_query(`insert into ${tableName} set ?`, entity),
  patch: (entity, condition, tableName) =>
    pool_query(`update ${tableName} set ? where ?`, [entity, condition]),
  del: (condition, tableName) =>
    pool_query(`delete from ${tableName} where ?`, condition),
};
