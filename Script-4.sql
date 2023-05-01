CREATE TABLE actor (
             id INT PRIMARY KEY AUTO_INCREMENT,
             NAME VARCHAR (32) NOT NULL DEFAULT '',
             sex CHAR (1) NOT NULL DEFAULT '女' ,
             borndate DATETIME ,
             phone VARCHAR(12));
SELECT * FROM actor;    
INSERT INTO actor VALUES(NULL,'燕小六','男','1970-12-12','110');
INSERT INTO actor VALUES(NULL,'jack','男','1999-11-11','112');


create table account(
                   id int primary key auto_increment, 
                   name varchar(32) not null default '',
                   balance double not null default 0) 
                   character set utf8;
insert into account values(null, '马云', 3000); 
insert into account values(null, '马化腾',10000);

SELECT * FROM account;


CREATE TABLE admin2
                 (id INT PRIMARY KEY AUTO_INCREMENT,
                  username VARCHAR (32) NOT NULL,
                  password VARCHAR (32) NOT NULL) ;
                 
DROP TABLE admin2;            
 SELECT * FROM admin2;              
