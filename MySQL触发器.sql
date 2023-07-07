#触发器
CREATE DATABASE dbtest17;

USE dbtest17;

CREATE TABLE test_trigger ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
t_note VARCHAR(30)
);
CREATE TABLE test_trigger_log ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
t_log VARCHAR(30)
);

SELECT * FROM test_trigger;
SELECT * FROM test_trigger_log;

DELIMITER //
CREATE TRIGGER before_insert_test_tri
BEFORE INSERT ON test_trigger
FOR EACH ROW 
BEGIN 
	INSERT INTO test_trigger_log(t_log)
	VALUES('before insert...'); 
	
END //

DELIMITER ; 

INSERT INTO test_trigger(t_note)
VALUES('Tom...');

SELECT * FROM test_trigger;
SELECT * FROM test_trigger_log;

DROP TABLE test_trigger;

DROP TABLE test_trigger_log;


DELIMITER //
CREATE TRIGGER after_insert_test_tri
AFTER INSERT ON test_trigger
FOR EACH ROW 
BEGIN 
	INSERT INTO test_trigger_log(t_log)
	VALUES('after insert...');
	
END //
DELIMITER ;

INSERT INTO test_trigger(t_note)
VALUES('Jerry...');

SELECT * FROM test_trigger;
SELECT * FROM test_trigger_log;


CREATE TABLE employees
AS
SELECT * FROM atguigudb.employees;
CREATE TABLE departments
AS
SELECT * FROM atguigudb.departments;


#查看触发器
SHOW TRIGGERS;

SHOW CREATE TRIGGER after_insert_test_tri;

SELECT * FROM information_schema.TRIGGERS;

#删除触发器
DROP TRIGGER IF EXISTS after_insert_test_tri;



