#分支结构 IF
#1
DELIMITER //
CREATE PROCEDURE test_if ()
BEGIN
	#声明局部変量
	DECLARE stu_name VARCHAR(15);
	IF stu_name IS NULL
	THEN SELECT 'stu name is null';
    END IF;
END //
DELIMITER ;

CALL test_if ();

#2
DELIMITER //
CREATE PROCEDURE test_if2 ()
BEGIN
	#声明局部変量 二选一
	DECLARE email VARCHAR(25);
	IF email IS NULL
	THEN SELECT 'email is null';
	ELSE
	SELECT 'email is not null';
	END IF;
END //
DELIMITER ;

CALL test_if2 ();

#3
DELIMITER //
CREATE PROCEDURE test_if3 ()
BEGIN
	#声明局部変量 多选一
	DECLARE age INT DEFAULT 20;
	IF age > 40
	           THEN SELECT '中老年';
	ELSEIF age > 18
	           THEN SELECT '青壮年';
	ELSEIF age > 8
	           THEN SELECT '青少年';
    ELSE
        SELECT '婴幼儿';
    END IF;
END //
DELIMITER ;

CALL test_if3 ();

#分支结构CASE
DELIMITER //
CREATE PROCEDURE test_case()
BEGIN
	DECLARE var INT DEFAULT 2;
    CASE var
            WHEN 1 THEN SELECT 'var=1';
            WHEN 2 THEN SELECT 'var=2';
            WHEN 3 THEN SELECT 'var=3';
            ELSE SELECT 'other value';
     END CASE ;
END//
DELIMITER ;

#调用
CALL test_case ();

DELIMITER //
CREATE PROCEDURE test_case1()
BEGIN
	DECLARE var1 INT DEFAULT 10;
    CASE 
            WHEN var1>=100 THEN SELECT '三位数';
            WHEN var1>=10 THEN SELECT '二位数';
            ELSE SELECT '个位数';
     END CASE ;
END//
DELIMITER ;

#调用
CALL test_case1 ();





 
