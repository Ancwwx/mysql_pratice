CREATE DATABASE test16_var_cursor;

USE test16_var_cursor;

CREATE TABLE employees
AS
SELECT * FROM atguigudb.employees;

CREATE TABLE departments
AS
SELECT * FROM atguigudb.departments;

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $

CREATE FUNCTION get_count ()
RETURNS INT
BEGIN
	#声明局部变量
	DECLARE emp_count INT;
	
	SELECT COUNT(*) INTO emp_count FROM employees;
	RETURN emp_count;
END $
DELIMITER ;

SELECT get_count();


DELIMITER $
CREATE FUNCTION ename_salary(emp_name VARCHAR (15))
RETURNS DOUBLE
BEGIN
		#声明变量
		SET @sal = 0;
		#赋值
		SELECT salary INTO @sal FROM employees WHERE last_name = emp_name;
		RETURN @sal;
END $
DELIMITER ;
#调用
SELECT ename_salary('Abel');

DELIMITER //
CREATE FUNCTION add_float (valuel FLOAT, value2 FLOAT)
	RETURNS FLOAT
BEGIN
	DECLARE sum_val FLOAT ;
	SET sum_val = valuel + value2;
	RETURN sum_val;
END //
DELIMITER ;

SET @v1 :=12.2;
SET @v2 :=2.3;
SELECT add_float(@v1,@v2);

DELIMITER $
CREATE FUNCTION test_if_case1 (score DOUBLE)
RETURNS CHAR
BEGIN
	#声明变量
	DECLARE score_level CHAR;
	IF score > 90
	THEN SET score_level = 'A';
	ELSEIF score > 80
	THEN SET score_level = 'B';
	ELSEIF score > 60
	THEN SET score_level = 'C';
	ELSE
	SET score_level = 'D';
	END IF;
	#返回
	RETURN score_level;
END $
DELIMITER ;

SELECT test_if_case1(98);


DELIMITER $
CREATE FUNCTION test_if_case2 (score DOUBLE)
RETURNS CHAR
BEGIN
	DECLARE score_level CHAR;
	CASE
	WHEN score > 90 THEN SET score_level = 'A';
	WHEN score > 80 THEN SET score_level = 'B';
	WHEN score > 60 THEN SET score_level = 'C';
	ELSE SET score_level = 'D';
	END CASE;
	RETURN score_level;
END $
DELIMITER ;
SELECT test_if_case2(76);

DELIMITER $
CREATE PROCEDURE test_if_pro (IN sal DOUBLE)
BEGIN
	IF sal < 3000
	              THEN DELETE FROM employees WHERE salary = sal;
	ELSEIF sal <=5000
	              THEN UPDATE employees SET salary = salary + 1000 WHERE salary = sal;
	ELSE
	              UPDATE employees SET salary = salary + 500 WHERE salary = sal;
	END IF;
END $
DELIMITER ;
CALL test_if_pro(2900);

