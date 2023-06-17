
CREATE DATABASE IF NOT EXISTS test01_office CHARACTER SET 'utf8';
USE test01_office;

CREATE TABLE IF NOT EXISTS dept01(
id INT(7) ,
name VARCHAR(25)
);

CREATE TABLE dept02
AS
SELECT *
FROM atguigudb.departments;

CREATE TABLE emp01 ( 
id INT (7), 
first_name VARCHAR (25), 
last_name VARCHAR (25) , 
dept_id INT (7)
 ) ;
 
DESC emp01;

ALTER TABLE emp01 
MODIFY last_name VARCHAR(50);

CREATE TABLE emp02 
AS
SELECT *
FROM atguigudb.employees; 

SHOW TABLES FROM test01_office;

DROP TABLE emp01;

RENAME TABLE emp02
TO emp01;

ALTER TABLE emp01 
ADD test_column VARCHAR(10);

DESC emp01;

ALTER TABLE dept02 
ADD test_column VARCHAR(10);

DESC dept02;

ALTER TABLE emp01 
DROP COLUMN department_id;

CREATE DATABASE IF NOT EXISTS test02_market CHARACTER SET 'utf8';
USE test02_market;
SHOW CREATE DATABASE test02_market;

CREATE TABLE IF NOT EXISTS customers ( 
c_num INT,
c_name VARCHAR (50),
c_contact VARCHAR (50), 
c_city VARCHAR (50),
c_birth DATE
);

SHOW TABLES;

DESC customers ;

ALTER TABLE customers
MODIFY c_contact VARCHAR (50) AFTER c_birth;

ALTER TABLE customers
MODIFY c_name VARCHAR (70) ;

ALTER TABLE customers 
CHANGE c_contact c_phone VARCHAR(50);

ALTER TABLE customers
ADD c_gender CHAR (1) AFTER c_name;

RENAME TABLE customers
TO customers_info;

ALTER TABLE customers_info
DROP COLUMN c_city;
