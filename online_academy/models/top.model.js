const db = require('../utils/db');

module.exports = {
    top10AllCat() {
        return db.load('SELECT * FROM course ORDER BY VIEW DESC LIMIT 10');
    },
    top10NewAllCat() {
        return db.load('SELECT * from course order by CreatedAt DESC limit 10');
    },
    topCatOfWeek() {
        return db.load(`SELECT
        subcategory.SubcategoryID, COUNT(*)
    FROM
        subcategory
    LEFT JOIN course ON course.SubCategoryID = subcategory.SubcategoryID
    LEFT JOIN joincourse ON joincourse.CourseID = course.CourseID
    WHERE
        WEEK(DATE) = WEEK(CURRENT_DATE) AND MONTH(DATE) = MONTH(CURRENT_DATE)
    GROUP BY
        subcategory.SubcategoryID`)
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
    }
}