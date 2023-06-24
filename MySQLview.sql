#视图(View)
/*
1．视图的理解
。视图，可以看做是一个虚拟表，本身是不存储数据的。
 视图的本质，就可以看做是存储起来的SELECT语句
。视图中SELECT语句中涉及到的表，称为基表
。针对视图做DML操作，会影响到对应的集表中的数据。反之亦然。
。视图本身的删除，不会导致基表中数据的删除。
。视图的应用场景：针对于小型项目，不推荐使用视图。针对于大型项目，可以考虑使用视图。
。视图的优点：简化查询；控制数据的访问
*/

#2.如何创建视图
CREATE DATABASE dbtest14;
USE dbtest14;

CREATE TABLE emps
AS
SELECT *
FROM atguigudb.employees;


CREATE TABLE depts
AS
SELECT *
FROM atguigudb.departments;

SELECT * FROM emps;

SELECT * FROM depts;

DESC emps;

DESC depts;

#针对单表
CREATE VIEW vu_emp1
AS
SELECT employee_id, last_name, salary
FROM emps;
SELECT * FROM vu_emp1;

CREATE VIEW vu_emp2
AS
SELECT employee_id emp_id, last_name lname, salary
FROM emps
WHERE salary > 8000;

SELECT * FROM vu_emp2;

CREATE VIEW vu_emp3(emp_id,NAME,monthly_sal)
AS
SELECT employee_id emp_id, last_name lname, salary
FROM emps
WHERE salary > 8000;

SELECT * FROM vu_emp3;

CREATE VIEW vu_emp_sal
AS
SELECT department_id, AVG (salary) avg_sal
FROM emps
WHERE department_id IS NOT NULL
GROUP BY department_id;

SELECT * FROM vu_emp_sal;

#针对于多表
CREATE VIEW vu_emp_dept
AS
SELECT e.employee_id, e.department_id, d.department_name
FROM emps e JOIN depts d
ON e. department_id= d.department_id;

SELECT * FROM vu_emp_dept;

CREATE VIEW vu_emp_dept1
AS
SELECT CONCAT (e.last_name, ' (', d.department_name, ') ') emp_info
FROM emps e JOIN depts d
ON e.department_id = d.department_id;

SELECT * FROM vu_emp_dept1;

#基于视图创建视图
CREATE VIEW vu_emp4
AS
SELECT employee_id, last_name
FROM vu_emp1;
SELECT * FROM vu_emp4;

#3．查吞视图
# 语法1：查看数据库的表对象、视图对象
SHOW TABLES;
#语法2：查看视图的结构
DESCRIBE vu_emp1;
#语法3：查看视图的属性信息
SHOW TABLE STATUS LIKE 'vu emp1';
#语法4：查看视图的详细定义信息
SHOW CREATE VIEW vu_emp1;

#更新视图中的数据
SELECT * FROM vu_emp1;
SELECT employee_id, last_name, salary
FROM emps;
UPDATE vu_emp1
SET salary = 20000
WHERE employee_id = 101;

UPDATE emps
SET salary = 10000
WHERE employee_id = 101;

#修改视图
#方式一
DESC vu_emp1;

CREATE OR REPLACE VIEW vu_emp1
AS
SELECT employee_id, last_name, salary, email
FROM emps
WHERE salary > 7000;

#方式二
ALTER VIEW vu_emp1
AS
SELECT employee_id, last_name, salary, email,hire_date
FROM emps;

#删除视图
SHOW TABLES;
DROP VIEW vu_emp4;
DROP VIEW IF EXISTS vu_emp2, vu_emp3;