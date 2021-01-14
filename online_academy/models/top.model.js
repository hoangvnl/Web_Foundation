const db = require('../utils/db');

module.exports = {
    top10AllCat() {
        return db.load('SELECT * FROM course ORDER BY VIEW DESC LIMIT 10');
    },
    top10NewAllCat() {
        return db.load('SELECT * from course order by CreatedAt DESC limit 10');
    },

    fiveCourseSameCat(id) {
        return db.load(`SELECT
CourseID
FROM
course
WHERE
CourseID IN(
SELECT
    *
FROM
    (
    SELECT
        course.CourseID
    FROM
        course
    LEFT JOIN joincourse ON course.CourseID = joincourse.CourseID
    WHERE
        course.SubCategoryID IN(
        SELECT
            course.SubCategoryID
        FROM
            course
        WHERE
            CourseID = '${id}'
    ) AND course.CourseID <> '${id}'
GROUP BY
    course.CourseID
ORDER BY
    COUNT(joincourse.UserID)
DESC
LIMIT 5
) AS t
)
LIMIT 5`)
    },
    courseOfTheWeek() {
        return db.load(`select * from course left join rating on course.CourseID = rating.CourseID order by (rating.totalRates/rating.totalVotes) desc limit 3`);
    },
    categoryOfTheWeek() {
        return db.load(`SELECT
        subcategory.SubcategoryID,subcategory.SubcategoryName,subcategory.CategoryID, COUNT(*)
    FROM
        subcategory
    LEFT JOIN course ON course.SubCategoryID = subcategory.SubcategoryID
    LEFT JOIN joincourse ON joincourse.CourseID = course.CourseID
    WHERE
        WEEK(JoinDate) = WEEK(CURRENT_DATE) AND MONTH(JoinDate) = MONTH(CURRENT_DATE)
    GROUP BY
        subcategory.SubcategoryID
    LIMIT 5`);
    },
    getNewCourse() {
        return db.load(`SELECT CourseID FROM course WHERE WEEK(CreatedAt) = WEEK(CURRENT_DATE) AND YEAR(CreatedAt) = YEAR(CURRENT_DATE) AND MONTH(CreatedAt) = MONTH(CURRENT_DATE)`);
    },
    getBestSeller(SubCatID) {
        return db.load(`SELECT CourseID FROM course WHERE SubcategoryID = ${SubCatID} ORDER BY course.StudentCount DESC LIMIT 3`);
    }
}