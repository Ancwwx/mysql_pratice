CREATE OR REPLACE VIEW employee_vu (lname, emp_id, dept_id)
AS
SELECT last_name, employee_id, department_id
FROM emps;
#显示视图的结构
DESC employee_vu;

SELECT * FROM employee_vu;

CREATE OR REPLACE VIEW employee_vu (lname, emp_id, dept_id)
AS
SELECT last_name, employee_id, department_id
FROM emps
WHERE department_id = 80;

CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name, salary, email
FROM emps
WHERE phone_number LIKE '011%';

CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name, email, phone_number,salary 
FROM emps
WHERE phone_number LIKE '011%'
AND email LIKE '%e%';

UPDATE emp_v1 SET salary=salary + 1000;

DELETE FROM emp_v1 
WHERE last_name='Olsen';

CREATE OR REPLACE VIEW emp_v2(dept_id, max_sal)
AS
SELECT department_id, MAX(salary)
FROM emps
GROUP BY department_id
HAVING MAX(salary) > 12000;

DROP VIEW IF EXISTS emp_v1,emp_v2;

SHOW TABLES;