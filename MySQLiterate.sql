#ITERATE的使用

DELIMITER //
CREATE PROCEDURE test_iterate ()
BEGIN
	DECLARE num INT DEFAULT 0;
	loop_label:LOOP
			SET num = num + 1;
			IF num < 10
			THEN ITERATE loop_label;
			ELSEIF num > 15
			THEN LEAVE loop_label;
			END IF;
			SELECT 'hello MySQL';
			END LOOP;
END //
DELIMITER ;

CALL test_iterate();


#游标的使用
DELIMITER //
CREATE PROCEDURE get_count_by_limit_total_salary (IN limit_total_salary DOUBLE,OUT total_count INT)
BEGIN
	#声明局部变量
	DECLARE sum_sal DOUBLE DEFAULT 0.0; #记录累加的工资总额
	DECLARE emp_sal DOUBLE;#记录每一个员工的工资
	DECLARE emp_count INT DEFAULT 0;#记录累加的人数
	#1.声明游标
	DECLARE emp_cursor CURSOR FOR SELECT salary FROM employees ORDER BY salary DESC;
	#2.打开游标
	OPEN emp_cursor;
	    REPEAT
				  #3.使用游标
				  FETCH emp_cursor INTO emp_sal;
				  SET sum_sal = sum_sal + emp_sal;
	              SET emp_count = emp_count + 1;
	              UNTIL sum_sal >= limit_total_salary
	    END REPEAT;
	    SET total_count = emp_count;
	   #4.关闭游标
        CLOSE emp_cursor;
END //
DELIMITER ;

CALL get_count_by_limit_total_salary(200000,@total_count);
SELECT @total_count;