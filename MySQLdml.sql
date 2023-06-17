USE atguigudb;

CREATE TABLE IF NOT EXISTS emp1(
id INT,
name VARCHAR(15),
hire_date DATE,
salary DOUBLE(10,2)
);

DESC emp1;

SELECT * FROM emp1;

INSERT INTO emp1
VALUES (1, 'Tom','2000-12-21',3400);

INSERT INTO emp1 (id, hire_date, salary, name)
VALUES (2,'1999-09-09', 4000, 'Jerry');

INSERT INTO emp1 (id, salary, name)
VALUES (3, 4500, 'shk');

INSERT INTO emp1 (id,name, salary)
VALUES
(4, 'Jim', 5000),
(5, '张俊杰',5500);

INSERT INTO emp1 (id, name, salary, hire_date)
SELECT employee_id, last_name, salary, hire_date
FROM employees
WHERE department_id IN (70,60);


#更新数据（或修改数据）
UPDATE emp1
SET hire_date = NOW()
WHERE id = 5;

UPDATE emp1
SET hire_date = NOW(),salary=6000
WHERE id = 4;
SELECT * FROM emp1;

UPDATE emp1
SET salary = salary*1.2
WHERE name LIKE '%a%';

SELECT * FROM emp1;

#删除数据啊
DELETE FROM emp1
WHERE id=1;

#MySQL8新特性：计算列
USE atguigudb;

DROP TABLE test1;
CREATE TABLE test1(
a INT,
b INT,
c INT GENERATED ALWAYS AS (a + b) VIRTUAL
);

INSERT INTO test1 (a, b)
VALUES (10, 20);

SELECT * FROM test1;

UPDATE test1
SET a=100;