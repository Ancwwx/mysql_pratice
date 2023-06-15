SELECT AVG(salary), SUM(salary), AVG(salary) * 107
FROM employees;
SELECT MAX(last_name), MIN(last_name), MAX(hire_date), MIN(hire_date)
FROM employees;

#1.3 COUNT:注意 指定字短再查询结构中 个数不包括null
#作用：计算指定字段在查询结构中出现的个数
SELECT COUNT(employee_id),COUNT(salary) ,COUNT(2*salary) ,COUNT(1) 
FROM employees;

# AVG = SUM / COUNT
SELECT AVG(salary), SUM(salary) / COUNT(salary),
AVG(commission_pct), SUM(commission_pct) / COUNT(commission_pct),
SUM(commission_pct) / 107
FROM employees;

#GROUP BY
SELECT department_id, AVG (salary),SUM(salary)
FROM employees
GROUP BY department_id;

SELECT AVG (salary)
FROM employees
GROUP BY job_id;

#结论：SELECT中出现的非组函数的字段必须声明在GROUP BY 中。
#反之，GROUP By中声明的字段可以不出現在SELECT中。
SELECT department_id, job_id, AVG (salary)
FROM employees
GROUP BY department_id, job_id;

#说明：当使用ROLLUP时，不能同时使用ORDER BY子句进行结果排序，即ROLLUP和ORDER BY是互相排斥的。
SELECT department_id, AVG (salary)
FROM employees
GROUP BY department_id WITH ROLLUP;

#3• HAVING的使用（作用：用来过滤数据的）
#练习：查询各个部门中最高工资比10000高的部门信息

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;
#结论1：如果过滤条件中使用了聚合两数，则必须使用HAVING来替换WHERE。否则，报错。
#要求2： HAVING 必须声明在 GROUP BY 的后面。
#要求3：开发中，我们使用HAVING的前提是sQI中使用了GROUP BY。

SELECT department_id, MAX(salary)
FROM employees
WHERE department_id IN (10,20, 30, 40)
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000 AND department_id IN (10,20, 30, 40);

/*
#sq192语法:
SELECT ....,.........（存在聚合函数）
FROM ....
WHERE 多表的连接条件 AND 不包含聚合函数的过滤条件
GROUP BY ...
HAVING 包含聚合函数的过滤条件
ORDER BY..,...(ASC / DESC )
LIMIT
*/

/*
 #sg199语法：
SELECT ..............（存在聚合函数）
FROM ...
(LEFT / RIGHT) JOIN ...ON 多表的连接条件
(LEFT / RIGHT) JOIN ... ON
WHERE 不包含聚合函数的过滤条件
GROUP BY...,...
HAVING 包含聚合两数的过滤条件
ORDER BY ...... (ASC / DESC )
LIMIT ..., ....
*/