CREATE DATABASE mytest1;

SHOW DATABASES;

CREATE DATABASE mytest2 CHARACTER SET 'gbk'; 

SHOW CREATE DATABASE mytest2;

USE atguigudb;
SHOW tables;

SELECT DATABASE() FROM DUAL;

SHOW TABLES FROM mysql;

ALTER DATABASE mytest2 CHARACTER SET 'utf8';

DROP DATABASE mytest1;

DROP DATABASE mytest2;

SHOW DATABASES;

CREATE TABLE IF NOT EXISTS myemp1 ( 
id INT, emp_name VARCHAR (15), hire_ate DATE
) ;

#查看表结构
SHOW CREATE TABLE myemp1;

#查看创建表的语句结构
SHOW CREATE TABLE myemp1;

#方式2：基于现有的表
CREATE TABLE myemp2
AS
SELECT employee_id, last_name,salary
FROM employees;

DESC myemp2;
DESC employees ;

SELECT *
FROM myemp2;
CREATE TABLE myemp3
AS
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT *
FROM myemp3;
#练习1：创建一个表employees_copy，实现对employees表的复制，包括表数据
CREATE TABLE employees_copy
AS
SELECT *
FROM employees;

SELECT *
FROM employees_copy;

#练习2：创建一个表employees_blank，实现对employees表的复制，不包括表数据
CREATE TABLE employees_blank
AS
SELECT *
FROM employees
WHERE 1 = 2;

SELECT *
FROM employees_blank;