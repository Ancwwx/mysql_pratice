DESC employees ;

DESC departments ;

DESC locations ;

SELECT * FROM employees 
WHERE last_name ='Abel';

SELECT employee_id,department_name
FROM employees , departments ;

SELECT employee_id,department_name
FROM employees , departments 
WHERE employees.department_id =departments.department_id ;

SELECT employees.employee_id,departments.department_name,employees.department_id 
FROM employees , departments 
WHERE employees.department_id =departments.department_id ;

#给表起别名
SELECT emp.employee_id,dept.department_name,emp.department_id 
FROM employees emp, departments dept
WHERE emp.department_id =dept.department_id ;

SELECT e.employee_id , e.last_name , d.department_name , l.city , e.department_id , l.location_id 
FROM employees e, departments d,locations l
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id ;

#非等值链接 例
SELECT * FROM job_grades ;

SELECT e.last_name , e.salary , j.grade_level
FROM employees e ,job_grades j
#WHERE e.salary  BETWEEN j.lowest_sal AND j.highest_sal ;
WHERE e.salary >= j.lowest_sal AND e.salary  <= j.highest_sal ;

SELECT emp.employee_id , emp.last_name , mgr.employee_id , mgr.last_name
FROM employees emp , employees mgr
WHERE emp.manager_id = mgr.employee_id ;

#左右外连接
#SQL92语法实现内连接：见下
SELECT employee_id , department_name 
FROM employees e , departments d  
WHERE e.department_id = d.department_id ;
#SQL92语法实现外连接：使用+  MySQL不支持SQL92语法中外连接的写法!
SELECT employee_id , department_name 
FROM employees e , departments d  
WHERE e.department_id = d.department_id(+);

#SQL99语法中使用JOIN..ON的方式实现多表的查询.MySQL是支持此种方式的
#FROM语句中左右两边表 哪边要显示数据多就为哪边连接
#SQL99语法实现内连接
SELECT last_name , department_name 
FROM employees e INNER JOIN departments d  
ON e.department_id = d.department_id ;

SELECT last_name , department_name ,city
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id 
JOIN locations l 
ON d.location_id =l.location_id ;

#SQL99语法实现外连接
SELECT last_name , department_name 
FROM employees e LEFT OUTER JOIN departments d  
ON e.department_id = d.department_id ;

SELECT last_name , department_name 
FROM employees e RIGHT OUTER JOIN departments d  
ON e.department_id = d.department_id ;

#满外连接
SELECT last_name , department_name 
FROM employees e FULL OUTER JOIN departments d  
ON e.department_id = d.department_id ;

#UNION 会执行去重操作
#UNION ALL 不会执行去重操作
#结论：如果明确知道合并数据后的结果数据不存在重复数据，或者不需要去除重复数据，则尽量使用NUION ALL以提高数据查询的效率

#7种JOIN的实现
SELECT employee_id , department_name 
FROM employees e JOIN departments d  
ON e.department_id = d.department_id;

SELECT employee_id , department_name 
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id;

SELECT employee_id , department_name 
FROM employees e RIGHT JOIN departments d  
ON e.department_id = d.department_id;

SELECT employee_id , department_name 
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

SELECT employee_id , department_name 
FROM employees e RIGHT JOIN departments d  
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

SELECT employee_id , department_name 
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id
UNION ALL
SELECT employee_id , department_name 
FROM employees e RIGHT JOIN departments d  
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

SELECT employee_id , department_name 
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id
WHERE d.department_id IS NULL
UNION ALL 
SELECT employee_id , department_name 
FROM employees e RIGHT JOIN departments d  
ON e.department_id = d.department_id;

SELECT employee_id , department_name 
FROM employees e RIGHT JOIN departments d  
ON e.department_id = d.department_id
WHERE e.department_id IS NULL
UNION ALL 
SELECT employee_id , department_name 
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

#SQL99语法的新特性 
#1.自然连接:自动查询两张连接表中所有相同字段，进行等值连接
SELECT employee_id, last_name, department_name
FROM employees e JOIN departments d 
ON e.department_id =d.department_id 
AND e.manager_id =d.manager_id ;

SELECT employee_id,last_name,department_name
FROM employees e 
NATURAL JOIN departments d ;

#2.USING
SELECT employee_id, last_name, department_name
FROM employees e JOIN departments d 
ON e.department_id =d.department_id ;

SELECT employee_id, last_name, department_name
FROM employees e JOIN departments d 
USING (department_id) ;
