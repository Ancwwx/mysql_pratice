#存储函数
DELIMITER //
CREATE FUNCTION email_by_name()
RETURNS VARCHAR(25)
		DETERMINISTIC 
		CONTAINS SQL
		READS SQL DATA
BEGIN
	RETURN (SELECT email FROM employees WHERE last_name ='Abel');
END //
DELIMITER ;

#调用
SELECT email_by_name();

#举例2：创建存储函数：名称为email_by_id(），参数传入emp_id，该函数查询emp_id的emai，
#并返回，数据类型为字符串型。
#创建函数前执行此语句，保证函数的创建会成功
SET GLOBAL log_bin_trust_function_creators = 1;
#声明函数
DELIMITER //
CREATE FUNCTION email_by_id(emp_id INT)
RETURNS VARCHAR (25)
BEGIN
	RETURN (SELECT email FROM employees WHERE employee_id = emp_id);
END //
DELIMITER ;

SELECT email_by_id(101);

SET @emp_id=102;
SELECT email_by_id(@emp_id);

DELIMITER //
CREATE FUNCTION count_by_id(dept_id INT)
RETURNS INT
BEGIN
     RETURN (SELECT COUNT(*) FROM employees WHERE department_id = dept_id);
END //
DELIMITER ;

SET @dept_id := 30;
SELECT count_by_id(@dept_id);