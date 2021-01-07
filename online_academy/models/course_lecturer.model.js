const db = require('../utils/db');
const TBL_COURSE_LECTURER = 'course_lecturer'

module.exports = {
    add(entity) {
        return db.add(entity, TBL_COURSE_LECTURER);
    }
}