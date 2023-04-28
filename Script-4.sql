CREATE TABLE actor (
             id INT PRIMARY KEY AUTO_INCREMENT,
             NAME VARCHAR (32) NOT NULL DEFAULT '',
             sex CHAR (1) NOT NULL DEFAULT '女' ,
             borndate DATETIME ,
             phone VARCHAR(12));
SELECT * FROM actor;    
INSERT INTO actor VALUES(NULL,'燕小六','男','1970-12-12','110');
INSERT INTO actor VALUES(NULL,'jack','男','1999-11-11','112');
