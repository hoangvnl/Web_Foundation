create database Online_Academy
go
use Online_Academy
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

create table LECTURER (
	LecturerID int identity(1,1) primary key,
	LecturerName nvarchar(50)
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

create table COURSE_LECTURER (
	CourseID int foreign key references COURSE,
	LecturerID int foreign key references LECTURER,
	primary key (CourseID, LecturerID)
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

insert into LECTURER values('Academind by Maximilian Schwarzmüller'),
							('Maximilian Schwarzmüller'),
							('Dr. Angela Yu'),
							('Stephen Grider'),
							('Paulo Dichone'),
							('Andrea Bizzotto'),
							('Marcus Ng'),
							('Lutfor Rahman'),
							('Rob Percival'),
							('Marc Stock'),
							('Codestars by Rob Percival'),
							('Nick Walter'),
							('Tim Buchalka'),
							('Jean-Paul Roberts'),
							('Philipp Muellauer'),
							('Morteza Kordi')

insert into COURSE_LECTURER values ('1', '1'),
									('1', '2'),
									('2', '3'),
									('3', '4'),
									('4', '5'),
									('5', '6'),
									('6', '7'),
									('7', '8'),
									('8', '9'),
									('8', '10'),
									('8', '11'),
									('9', '9'),
									('9', '11'),
									('9', '12'),
									('10', '13'),
									('10', '14'),
									('11', '5'),
									('12', '15'),
									('13', '13'),
									('13', '14'),
									('14', '16')
									