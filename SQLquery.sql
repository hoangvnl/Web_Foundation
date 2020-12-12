create table Categories(CatID int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			 CatName varchar(64));
insert into Categories(CatID,CatName)
values (1,'Web Development'),
		(2,'Mobile Development');

create table subcategories(SubCatID int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,     
						   SubCatName varchar(64),
                           CatID int(11));

insert into subcategories (CatID, SubCatName)
values (2,'Google Flutter'),
	   (2,'Android Development'),
	   (1,'JavaScript'),
	   (1,'React'),
	   (1,'Css');
       
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
flush privileges;