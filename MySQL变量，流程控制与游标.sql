
#1．变量：系统变量（全局系统变量、会话系统变量）vs 用户自定义变量
#2. 查看系統変量
SHOW GLOBAL VARIABLES;

SHOW SESSION VARIABLES;
SHOW VARIABLES;#默认查询会话系统变量

SHOW GLOBAL VARIABLES LIKE 'admin_%';
SHOW VARIABLES LIKE 'character_%';

#查看指定的系统变量
SELECT @@global.max_connections;
SELECT @@session.character_set_client;
SELECT @@session.pseudo_thread_id;

SELECT @@character_set_client;#先查询会话系统变量，再查询全局系统变量

#修改系统变量的值
#针对于当前的数据库实例是有效的，一旦重启mysql服务，就失效了	 
#方式一
SET @@global.max_connections=161;
#方式二
SET GLOBAL max_connections=171;

#会话系统变量：
#方式1:
SET @@session.character_set_client = 'gbk';
SET SESSION character_set_client = 'gbk';
#针对于当前会话是有效的，一旦结束会话，重新建立起新的会话，就失效了。

#用户变量
/*
用戸変量： 会活用戸変量 vs 局部変量
会话用户变量：使用"@"开头，作用域为当前会话。
局部变量：只能使用在存储过程和存储函数中的。
*/

#会话用户变量 SET

CREATE DATABASE dbtest16;
USE dbtest16;
CREATE TABLE employees
AS
SELECT * FROM atguigudb.employees;
CREATE TABLE departments
AS
SELECT * FROM atguigudb.departments;
SELECT * FROM employees;
SELECT * FROM departments;

#测试
#方式一
SET @m1 = 1;
SET @m2 := 2;
SET @sum := @m1 + @m2;
SELECT @sum; 

#方式二
SELECT @count := COUNT(*) FROM employees;
SELECT @count;
SELECT AVG(salary) INTO @avg_sal FROM employees;
SELECT @avg_sal;

#局部变量 DECLARE
DELIMITER //
CREATE PROCEDURE test_var ()
BEGIN
	DECLARE a INT DEFAULT 0;
	DECLARE b INT;
	#DECLARE a,b INT DEFAULT 0;
	DECLARE emp_name VARCHAR (25);
	#赋值
	SET a = 1;
	SET b := 2;
	SELECT last_name INTO emp_name FROM employees WHERE employee_id = 101;
	#使用
	SELECT a, b, emp_name;
END //

DELIMITER ;

CALL test_var();

#定义条件
#格式：DECLARE 错误名称 CONDITION FOR 错误码（或错误条件）
#举例1：定义"Field_Not_Be_NuLL“错误名与MySQL中建反非空约束的错误类型
#是〝ERROR 1048 (23000)〞对应。
#方式1 使用MySQL_error_code
DECLARE Field_Not_Be_NULL CONDITION FOR 1048;

# 方式2:使用sqlstate_value
DECLARE Field_Not_Be_NULL CONDITION FOR SQLSTATE '23000';

#举例2：定义"ERROR 1148(42000)“错误，名称为command_not_allowed。
#方式1：使用MySQL_error_code
DECLARE command_not_allowed CONDITION FOR 1148;
#方式2：使用sglstate value
DECLARE command_not_allowed CONDITION FOR SQLSTATE '42000';

#案例
#重新定义存储过程，体现错误的处理程序
DELIMITER //
CREATE PROCEDURE UpdateDataNoCondition ()
BEGIN
	#声明处理程序
	#处理方式1
	DECLARE CONTINUE HANDLER FOR 1048 SET @prc_value=-1;
    #处理方式2
    #DECLARE CONTINUE HANDLER FOR sqlstate '2300' SET @prc_value=-1;
	SET @x = 1;
	UPDATE employees SET email = NULL WHERE last_name = 'Abel';
	SET @x = 2;
	UPDATE employees SET email = 'aabbel' WHERE last_name = 'Abel';
	SET @x = 3;
END //
DELIMITER ;

#调用存储过程
CALL UpdateDataNoCondition();
#查看变量
SELECT @x,@prc_value;

#举例：
#方法1：捕获sglstate_value
DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @info = 'NO_SUCH_TABLE';
#方法2: 捕状mysql error value
DECLARE CONTINUE HANDLER FOR 1146 SET @info = 'NO_SUCH_TABLE';
#方法3：先定义条件，再调用
DECLARE no_such_table CONDITION FOR 1146:
DECLARE CONTINUE HANDLER FOR NO_SUCH_TABLE SET @info = 'NO_SUCH_TABLE';
#方法4： 使用SQLWARNING
DECLARE EXIT HANDLER FOR SQLWARNING SET @info = 'ERROR' ;
#方法5: 使用NOT FOUND
DECLARE EXIT HANDLER FOR NOT FOUND SET @info = 'NO_SUCH_TABLE' ;
#方法6: 使用SQLEXCEPTION
DECLARE EXIT HANDLER FOR SOLEXCEPTION SET @info = 'ERROR' ;

