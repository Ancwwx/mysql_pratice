USE atguigudb;
SELECT * FROM employees WHERE last_name = 'King';

SELECT employee_id ,last_name ,salary *12 * (1+IFNULL(commission_pct,0)) "ANNUAL SALARY" FROM employees ;

SELECT last_name ,salary  FROM employees WHERE salary >12000;

SELECT last_name ,department_id  FROM employees WHERE employee_id =176;

DESC departments ;

SELECT * FROM departments ;

SELECT * FROM locations ;


