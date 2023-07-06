CREATE DATABASE test17_trigger;
USE test17_trigger;
CREATE TABLE emps
AS
SELECT employee_id, last_name, salary
FROM atguigudb.employees;
SELECT * FROM emps;

CREATE TABLE emps_back
AS
SELECT * FROM emps 
WHERE 1=2;

SELECT * FROM emps_back;

DELIMITER //
CREATE TRIGGER emps_insert_trigger 
AFTER INSERT ON emps
FOR EACH ROW 
BEGIN 
	INSERT INTO emps_back(employee_id, last_name, salary)
	VALUES(NEW.employee_id, NEW.last_name, NEW.salary);
	
	
END //
DELIMITER ;

SHOW TRIGGERS;

INSERT INTO emps(employee_id, last_name, salary)
VALUES(300,'Tom',3400);


CREATE TABLE emps_back1
AS
SELECT * FROM emps 
WHERE 1=2;
SELECT * FROM emps_back1;

DELIMITER //
CREATE TRIGGER emps_insert_trigger1
BEFORE DELETE ON emps
FOR EACH ROW 
BEGIN 
	INSERT INTO emps_back1(employee_id, last_name, salary)
	VALUES(OLD.employee_id, OLD.last_name, OLD.salary);
	END //
DELIMITER ;

DELETE FROM emps
WHERE employee_id =100;

SELECT * FROM emps;

SELECT * FROM emps_back1;

