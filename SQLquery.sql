create table Categories(CatID int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			 CatName varchar(64));
insert into Categories(CatID,CatName)
values (1,'Web Development'),
		(2,'Mobile Development');
        

       
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
flush privileges;