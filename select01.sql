CREATE TABLE student(
id INT NOT NULL DEFAULT 1,
NAME VARCHAR(20) NOT NULL DEFAULT '', chinese FLOAT NOT NULL DEFAULT 0.0, english FLOAT NOT NULL DEFAULT 0.0,
math FLOAT NOT NULL DEFAULT 0.0
);
INSERT INTO student(id,NAME,chinese,english,math) VALUES(1,'韩顺平',89,78,90); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(2,'张飞',67,98,56); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(3,'宋江',87,78,77); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(4,'关羽',88,98,90); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(5,'赵云',82,84,67); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(6,'欧阳锋',55,85,45); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(7,'黄蓉',75,65,30); 
INSERT INTO student(id,NAME,chinese,english,math) VALUES(8,'韩信',45,65,99);

SELECT * FROM student;
SELECT `name`,english FROM student;
SELECT DISTINCT english FROM student;

