#LEAVE的使用
DELIMITER //
CREATE PROCEDURE leave_begin (IN num INT)
begin_label:BEGIN
		IF num <= 0
		THEN LEAVE begin_label;
		ELSEIF num = 1
		THEN SELECT AVG(salary) FROM employees;
		ELSEIF num = 2
		THEN SELECT MIN(salary) FROM employees;
		ELSE
		SELECT MAX(salary) FROM employees;
		END IF;
#查询总人数
SELECT COUNT(*) FROM employees;
END //
DELIMITER ;

CALL leave_begin(1);


DELIMITER //
CREATE PROCEDURE leave_while (OUT num INT)
BEGIN
	DECLARE avg_sal DOUBLE;#记录平均工资
	DECLARE while_count INT DEFAULT 0; #记录循环次数
	SELECT AVG(salary) INTO avg_sal FROM employees; # 初始化条作
	while_label:WHILE TRUE DO # 循环条件
	# 循环体
			IF avg_sal <= 10000 THEN
			LEAVE while_label;
			END IF;
	UPDATE employees SET salary = salary * 0.9;
	SET while_count = while_count + 1;
	# 迭代条件
    SELECT AVG(salary) INTO avg_sal FROM employees;
   END WHILE;
 SET num = while_count;
END //
DELIMITER ;
DROP PROCEDURE leave_while;

CALL leave_while(@num);
SELECT @num;
