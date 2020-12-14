create database my_db
go
use my_db
go

create table CATEGORY (
	CategoryID int identity(1,1) primary key,
	CategoryName nvarchar(50)
)

create table SUBCATEGORY (
	SubcategoryID int identity(1,1) primary key,
	SubcategoryName nvarchar(50),
	CategoryID int foreign key references CATEGORY
)

create table COURSE (
	CourseID int identity(1,1) primary key,
	CourseName nvarchar(50),
	CourseImage varchar(100),
	ShortDes nvarchar(100),
	StudentCount int,
	Price int,
	SalePrice int,
	UpdatedAt date,
	SubcategoryID int foreign key references SUBCATEGORY
)

create table RATING (
	CourseID int primary key foreign key references COURSE,
	TotalRates int,
	TotalVotes int
)

create table FULLDES (
	FullDesID int identity(1,1) primary key,
	FullDes nvarchar(100),
	CourseID int foreign key references COURSE
)

create table COURSE_CONTENT (
	ContentID int identity(1,1) primary key,
	ContentName nvarchar(50),
	CourseID int foreign key references COURSE
)

create table VIDEO (
	VideoID int identity(1,1) primary key,
	CourseID int foreign key references COURSE
)

create table LECTURE (
	LectureID int identity(1,1) primary key,
	LectureName nvarchar(50),
	Preview int,
	Description nvarchar(100),
	VideoID int foreign key references VIDEO
)

insert into CATEGORY values('Web Development')
insert into CATEGORY values('Mobile Development')

insert into SUBCATEGORY(CategoryID, SubcategoryName) values(2,'Google Flutter'),
	   (2,'Android Development'),
	   (1,'JavaScript'),
	   (1,'React'),
	   (1,'Css')