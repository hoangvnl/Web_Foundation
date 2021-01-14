-- isNew
--chạy những dòng này để bổ sung khóa học mới nhất vào
UPDATE `course` SET `CreatedAt` = '2020-01-14' WHERE 1
UPDATE `course` SET `CreatedAt` = '2021-01-14' WHERE `course`.`CourseID` = 1
UPDATE `course` SET `CreatedAt` = '2021-01-14' WHERE `course`.`CourseID` = 7
UPDATE `course` SET `CreatedAt` = '2021-01-14' WHERE `course`.`CourseID` = 10
UPDATE `course` SET `CreatedAt` = '2021-01-14' WHERE `course`.`CourseID` = 17
UPDATE `course` SET `CreatedAt` = '2021-01-14' WHERE `course`.`CourseID` = 30
-- chạy dòng này để lấy ra những khóa học isNew
SELECT CourseID FROM `course` WHERE WEEK(CreatedAt) = WEEK(CURRENT_DATE) AND YEAR(CreatedAt) = YEAR(CURRENT_DATE) AND MONTH(CreatedAt) = MONTH(CURRENT_DATE)

--isBestSeller
--này chỉ cho truy vấn tới một subcat cụ thể :((
SELECT CourseID FROM `course` WHERE SubcategoryID = '1' ORDER BY course.StudentCount DESC LIMIT 3
--mỗi sản phầm lấy courseID với subCatID để kiểm tra nhe m


-- 3-4 khóa học nổi bật nhất (theo rate)
select * from course left join rating on course.CourseID = rating.CourseID order by (rating.totalRates/rating.totalVotes) desc limit 3
--Hiển thị 10 khoá học được xem nhiều nhất (ở mọi lĩnh vực)
SELECT * FROM course ORDER BY VIEW DESC LIMIT 10
--Hiển thị 10 khoá học mới nhất (ở mọi lĩnh vực)
SELECT * from course order by CreatedAt DESC limit 10
--Hiển thị danh sách lĩnh vực được đăng ký học nhiều nhất trong tuần qua
SELECT
    subcategory.SubcategoryID, COUNT(*)
FROM
    subcategory
LEFT JOIN course ON course.SubCategoryID = subcategory.SubcategoryID
LEFT JOIN joincourse ON joincourse.CourseID = course.CourseID
WHERE
    WEEK(DATE) = WEEK(CURRENT_DATE) AND MONTH(DATE) = MONTH(CURRENT_DATE)
GROUP BY
    subcategory.SubcategoryID
--đếm reviews của giáo viên (ở đây ví dụ là LectureID = 1 nhe chỉnh lại ở cuối dòng)
select sum(r.TotalVotes) as totalreviews from rating r where r.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '1')
--Đếm số học sinh của giáo viên
select sum(c.StudentCount) as studentcount from course c where c.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '1')
--Đếm số số courses của giáo viên
select count(cl.CourseID) as coursecount from course_lecturer cl where cl.LecturerID = '1'
--số rating của giáo viên
select round((sum(r.TotalRates) / sum(r.TotalVotes)),1) as ratings from rating r where r.CourseID IN (select cl.CourseID from course_lecturer cl where cl.LecturerID = '1')
--5 khoá học khác cùng lĩnh vực được mua nhiều nhất(Chỗ nào có '1' thì thay bằng CourseID của khóa đang xét)
SELECT
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
                CourseID = '1'
        ) AND course.CourseID <> '1'
    GROUP BY
        course.CourseID
    ORDER BY
        COUNT(joincourse.UserID)
    DESC
LIMIT 5
    ) AS t
)
LIMIT 5