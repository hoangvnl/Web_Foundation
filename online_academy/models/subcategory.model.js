const db = require('../utils/db');
const TBL_SUBCATEGORY = 'SUBCATEGORY'
const config = require('../config/default.json');

module.exports = {
    all() {
        return db.load(`select * from ${TBL_SUBCATEGORY}`);
    },
    single(id) {
        return db.load(`select * from ${TBL_SUBCATEGORY} where SubcategoryID = ${id}`);
    },
    singleByName(name) {
        return db.load(`select * from ${TBL_SUBCATEGORY} where SubcategoryName = "${name}"`);
    },
    async getIDByName(name) {
        const rows = await db.load(`select SubcategoryID from ${TBL_SUBCATEGORY} where SubcategoryName = "${name}"`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].SubcategoryID;
        }
    },
    async getNameByID(id) {
        const rows = await db.load(`select SubcategoryName from ${TBL_SUBCATEGORY} where SubcategoryID = ${id}`);
        if (rows.length === 0) {
            return null;
        }
        else {
            return rows[0].SubcategoryName;
        }
    },
    searchByName(name) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,
        match (course.CourseName) against("${name}") AS cscore,
        match (subcategory.SubcategoryName) against("${name}") as sscore               
        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
        where match(course.CourseName) against ("${name}")
        or match (subcategory.SubcategoryName) against("${name}")
        order by (cscore + sscore) desc`);

    },
    searchByNameSortCost(name) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,if(course.SalePrice = -1, course.SalePrice*-1*course.Price,course.SalePrice) as price,
                        match (course.CourseName) against("${name}") AS cscore,
                        match (subcategory.SubcategoryName) against("${name}") as sscore               
                        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
                        where match(course.CourseName) against ("${name}")
                        or match (subcategory.SubcategoryName) against("${name}")
                        order by price, (cscore + sscore) desc`);

    },
    searchByNameSortRate(name) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,
                        match (course.CourseName) against("${name}") AS cscore,
                        match (subcategory.SubcategoryName) against("${name}") as sscore               
                        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID left join rating on course.CourseID = rating.CourseID
                        where match(course.CourseName) against ("${name}")
                        or match (subcategory.SubcategoryName) against("${name}")
                        order by (rating.TotalRates/rating.TotalVotes) desc,(cscore + sscore) desc`);

    },
    async countCourseSearchByName(name) {
        const rows = await db.load(`select count(*) as total, course.CourseID, subcategory.SubcategoryName     
        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
        where match(course.CourseName) against ("${name}")
        or match (subcategory.SubcategoryName) against("${name}")`);
        return rows[0].total;
    },
    searchPageByName(name, offset) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,
        match (course.CourseName) against("${name}") AS cscore,
        match (subcategory.SubcategoryName) against("${name}") as sscore               
        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
        where match(course.CourseName) against ("${name}")
        or match (subcategory.SubcategoryName) against("${name}")
        order by (cscore + sscore) desc limit ${config.pagination.limit} offset ${offset}`);

    },
    searchPageByNameSortCost(name, offset) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,if(course.SalePrice = -1, course.SalePrice*-1*course.Price,course.SalePrice) as price,
                        match (course.CourseName) against("${name}") AS cscore,
                        match (subcategory.SubcategoryName) against("${name}") as sscore               
                        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID
                        where match(course.CourseName) against ("${name}")
                        or match (subcategory.SubcategoryName) against("${name}")
                        order by price, (cscore + sscore) desc limit ${config.pagination.limit} offset ${offset}`);

    },
    searchPageByNameSortRate(name, offset) {
        return db.load(`select course.CourseName, course.CourseID, subcategory.SubcategoryName,
                        match (course.CourseName) against("${name}") AS cscore,
                        match (subcategory.SubcategoryName) against("${name}") as sscore               
                        from course left join subcategory on course.SubcategoryID = subcategory.SubcategoryID left join rating on course.CourseID = rating.CourseID
                        where match(course.CourseName) against ("${name}")
                        or match (subcategory.SubcategoryName) against("${name}")
                        order by (rating.TotalRates/rating.TotalVotes) desc,(cscore + sscore) desc limit ${config.pagination.limit} offset ${offset}`);

    },

}