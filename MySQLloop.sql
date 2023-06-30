#循环结构 loop
DELIMITER //
CREATE PROCEDURE loop_label()
BEGIN
	DECLARE num INT DEFAULT 1;
    loop_label:LOOP
	    SET num =num+1;
	    IF num>=10 THEN LEAVE loop_label;
	    END IF;
    END LOOP loop_label;
   SELECT num;
END //
DELIMITER ;

CALL loop_label();
DROP PROCEDURE loop_label;

DELIMITER //
CREATE PROCEDURE update_salary_loop(OUT num INT)
BEGIN
	DECLARE avg_sal DOUBLE;
    DECLARE loop_count INT DEFAULT 0;
    SELECT AVG(salary) INTO avg_sal FROM employees;
    loop_lab:LOOP
	    IF avg_sal >= 12000
	              THEN LEAVE loop_lab;
	    END IF;
	    UPDATE employees SET salary = salary*1.1;
	    SET loop_count = loop_count + 1;
	    SELECT AVG(salary) INTO avg_sal FROM employees;
    END LOOP loop_lab;
   SET num= loop_count;
END //
DELIMITER ;

CALL update_salary_loop(@num);
SELECT @num;

