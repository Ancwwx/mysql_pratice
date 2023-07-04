#循环结构 while

DELIMITER //
CREATE PROCEDURE test_while ()
BEGIN
	#初始化条件
	DECLARE num INT DEFAULT 1;
	#循环糸件
	WHILE num <= 10 DO
		#循环体（略）
		#迭代条件
	SET num = num + 1;
	END WHILE;
	#查询
	SELECT num;
END //
DELIMITER ;

CALL test_while();

DELIMITER //
CREATE PROCEDURE update_salary_while(OUT num INT)
BEGIN
	DECLARE avg_sal DOUBLE;
    DECLARE while_count INT DEFAULT 0;
    SELECT AVG(salary) INTO avg_sal FROM employees;
    WHILE avg_sal > 5000 DO
	    UPDATE employees SET salary = salary*0.9;
	    SET while_count = while_count + 1;
	    SELECT AVG(salary) INTO avg_sal FROM employees;
	    
    END WHILE;
   SET num= while_count;
END //
DELIMITER ;
DROP PROCEDURE update_salary_while;

CALL update_salary_while(@num);
SELECT @num;

SELECT AVG(salary) FROM employees ;