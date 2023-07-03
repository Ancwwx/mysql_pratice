CREATE DATABASE dbtest15;
USE dbtest15;

CREATE TABLE employees
AS
SELECT *
FROM atguigudb.employees;
CREATE TABLE departments
AS
SELECT * FROM atguigudb.departments;

SELECT * FROM employees;
SELECT * FROM departments;

#1．创建存储过程
#举例1：创建存储过程select_all_data（），查看employee 表的所有数据
DELIMITER $
CREATE PROCEDURE select_all_data()
BEGIN
	SELECT * FROM employees;
END $
DELIMITER ;

#2.存储过程的调用

CALL select_all_data();

DELIMITER $
CREATE PROCEDURE avg_employee_salary()
BEGIN 
	SELECT AVG(salary) FROM employees;
END $
DELIMITER ;

CALL avg_employee_salary();

DELIMITER //
CREATE PROCEDURE show_max_salary()
BEGIN
	SELECT MAX(salary) FROM employees;
END //
DELIMITER ;

CALL show_max_salary();

#类型2:OUT
#举例4：创建存儲过程show_min_salary()，查看〝emps”表的最低薪资值。并将最低薪资
#通过OUT參数〝ms“输出
DESC employees;
DELIMITER //
CREATE PROCEDURE show_min_salary (OUT ms DOUBLE)
BEGIN
	SELECT MIN(salary) INTO ms
	FROM employees;
END //
DELIMITER ;

#调用
CALL show_min_salary (@ms);

#查看
SELECT @ms;

#举例5：创建存储过程show_someone_salary()，查看〝emp:“表的某个员工的薪资，
#并用IN参数empname输入员工姓名。
DELIMITER //
CREATE PROCEDURE show_someone_salary (IN empname VARCHAR(20))
BEGIN
	SELECT salary FROM employees
	WHERE last_name = empname;
END //
DELIMITER ;

CALL show_someone_salary('Abel');

SET @empname :='Abel';
CALL show_someone_salary(@empname);

DELIMITER //
CREATE PROCEDURE show_someone_salary2(IN empname VARCHAR(20),OUT empsalary DECIMAL(10,2))
BEGIN 
	SELECT salary INTO empsalary
	FROM employees
	WHERE last_name = empname;
END //
DELIMITER ;

SET @empname = 'Abel';
CALL show_someone_salary2(@empname,@empsalary);

SELECT @empsalary;

DESC employees;
DELIMITER $
CREATE PROCEDURE show_mgr_name (INOUT empname VARCHAR (25))
BEGIN
	SELECT last_name INTO empname
	FROM employees
	WHERE employee_id = (
						SELECT manager_id
						FROM employees
						WHERE last_name = empname
						);
END $
DELIMITER ;
 
SET @empname :='Able';
CALL show_mgr_name(@empname);

SELECT @empname;
