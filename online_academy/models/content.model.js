const db = require('../utils/db');
const TBL_CONTENT = 'course_content';

module.exports = {
    allWithCourseID(id) {
        return db.load(`SELECT *
                        FROM ${TBL_CONTENT}
                        WHERE CourseID =  ${id}`);
    },
    async singleByNameAndCourseID(name, id) {
        const rows = await db.load(`SELECT *
                        FROM ${TBL_CONTENT}
                        WHERE ContentName =  "${name}" and CourseID = ${id}`);
        if (rows.length === 0) return null;
        return rows[0];
    },
    delAllByCourseID(id) {
        return db.load(`DELETE 
                        FROM ${TBL_CONTENT}
                        WHERE CourseID =  ${id}`);
    },
    add(entity) {
        return db.add(entity, TBL_CONTENT);
    },
    patch(entity) {
        const condition = { ContentID: entity.ContentID };
        delete entity.ContentID;
        return db.patch(entity, condition, TBL_CONTENT);
    },
    del(entity) {
        const condition = { ContentID: entity.ContentID };
        return db.del(condition, TBL_CONTENT);
    },

}