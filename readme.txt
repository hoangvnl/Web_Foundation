TO DO:

isCompleted theo dõi học sinh
xóa isNew, isCompleted trong course

bug:
 'Android O & Java - The Complete Android Development Bootcamp' có price = 0, saleprice = 300000


-----------------------------------
- tạo cột isCompleted là đã hoàn thành chưa trong bảng course

thêm ảnh add cart
isAdmin



(sửa cái buy)

Khoa
	_ Khóa tài khoản học viên + giảng viên : done
	_ Filter theo linh vuc : done
	_ Disable khoa hoc : done
	_ tạo db review + user : done
	_ video link 3 video để demo : done

anhkhoatranle30@gmail.com
1234


-----------------
theo dõi nếu người dùng xem video thì hiện đã đem





-------------------------------------------
isNew -> CourseID
isBestSeller -> CourseID



------------------------------------------------------------------------

login admin
thêm 1 trường description co duong link

clone account(joincourse)

reviews{
	UserID
	Rate
	Cmt
	}

thêm cột status vào course

làm SQL:
	Hiển thị 3-4 khoá học nổi bật nhất trong tuần qua
	+ Hiển thị 10 khoá học được xem nhiều nhất (ở mọi lĩnh vực)
	+ Hiển thị 10 khoá học mới nhất (ở mọi lĩnh vực)
	+ Hiển thị danh sách lĩnh vực được đăng ký học nhiều nhất trong tuần qua
	+ đếm reviews, số học sinh, số courses, số rating của giáo viên
	isBestseller và isNew cho course
	+ 5 khoá học khác cùng lĩnh vực được mua nhiều nhất

đi đánh giá

http://localhost:3000/khoa/des

------------------------------------------


4.6 sao totalvotes student
tinh ra sao totalrate/totalvote

nổi bật nhất: rate cao nhất 
xem nhiều nhất: view
mới: updateAt
đk nhiều nhất tuần
-------------------------------------------------
xem chi tiết khóa học
web - 3 lv - 7 khoa hoc/lv - Hoang dep trai
mobile - 2 lv - 7 khoa hoc/lv - Khoa

detail - Hoang dep trai
danh sach - Khoa

deadline: t4




Done
	navbar + category + footer: Hoang dep trai	
	carousel + slidershow: Khoa dep trai 


bestseller: top3 mỗi lĩnh vực