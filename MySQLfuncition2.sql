
#查看存储过程和函数信息
SHOW CREATE PROCEDURE show_mgr_name ;

SHOW CREATE FUNCTION count_by_id ;

SHOW PROCEDURE STATUS ;

SHOW PROCEDURE STATUS LIKE 'show_max_salary';

SHOW FUNCTION STATUS LIKE 'email_by_id';

SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME='email_by_id' AND ROUTINE_TYPE ='FUNCTION';

SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME='show_max_salary' AND ROUTINE_TYPE ='PROCEDURE';

#存储过程，函数的修改
ALTER PROCEDURE show_max_salary
SQL SECURITY INVOKER
COMMENT '查询最高工资';

#删除
DROP FUNCTION IF EXISTS count_by_id;

DROP PROCEDURE IF EXISTS show_min_salary;
