CREATE DATABASE test15_pro_func;
USE test15_pro_func;

CREATE TABLE admin ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
user_name VARCHAR (15) NOT NULL, 
pwd VARCHAR (25) NOT NULL
);

DELIMITER $
CREATE PROCEDURE insert_user (IN user_name VARCHAR (15), IN pwd VARCHAR (25))
BEGIN
	INSERT INTO admin(user_name, pwd)
	VALUES (user_name, pwd);
END $
DELIMITER ;

CALL insert_user('Tom','abc123');

SELECT * FROM admin;

CREATE TABLE beauty(
id INT PRIMARY KEY AUTO_INCREMENT, 
NAME VARCHAR (15) NOT NULL, 
phone VARCHAR (15) UNIQUE, 
birth DATE
) ;
INSERT INTO beauty (NAME, phone, birth)
VALUES
('朱茵','13201233453','1982-02-12'),
('孙燕姿','13501233653','1980-12-09'),
('田馥甄','13651238755','1983-08-21'),
('邓紫棋','17843283452','1991-11-12'),
('刘若英','186355754641','1989-05-18'),
('杨超越','13761238755','1994-05-11');

SELECT * FROM beauty;

DELIMITER //
CREATE PROCEDURE get_phone (IN id INT, OUT NAME VARCHAR(15) , OUT phone VARCHAR(15))
BEGIN
SELECT b.name, b.phone INTO NAME, phone
FROM beauty b
WHERE b.id = id;
END //
DELIMITER ;

CALL get_phone(3,@name,@phone);
SELECT @name,@phone;

DELIMITER //
CREATE PROCEDURE date_diff (IN birth1 DATE, IN birth2 DATE, OUT sum_date INT) 
BEGIN 
	SELECT DATEDIFF (birth1, birth2) INTO sum_date;
END //
DELIMITER ;

SET @birth1='1992-09-08';
SET @birth2='1992-07-08';
CALL date_diff(@birth1,@birth2,@sum_date);

SELECT @sum_date;

DELIMITER //
CREATE PROCEDURE format_date (IN my_date DATE, OUT str_date VARCHAR (25))
BEGIN
SELECT DATE_FORMAT (my_date, '%y年%m月%d日') INTO str_date;
END //
DELIMITER ;

CALL format_date(CURDATE(),@str);
SELECT @str;

DELIMITER //
CREATE PROCEDURE beauty_limit (IN start_index INT, IN size INT) 
BEGIN 
	SELECT * FROM beauty LIMIT start_index, size;

END //
DELIMITER ;

CALL beauty_limit (1, 3) ;

DELIMITER //
CREATE PROCEDURE add_double (INOUT a INT, INOUT b INT) 
BEGIN
	SET a = a * 2;
	SET b = b * 2;
END //
DELIMITER ;
SET @a=3,@b=5;
CALL add_double(@a, @b);

SELECT @a,@b;


