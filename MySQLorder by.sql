SELECT * FROM employees;


#ORDER BY 排序
#升序:ASC 
#降序:DESC 
SELECT employee_id,last_name,salary
FROM employees 
ORDER BY salary DESC;

#列的别名只能在order by中使用,不能在where中使用
SELECT employee_id,salary ,salary * 12 annual_sal
FROM employees 
ORDER BY annual_sal ;

#二级排序
SELECT employee_id,last_name,salary, department_id
FROM employees 
ORDER BY department_id DESC,salary ASC;

#分页 LIMIT (pageNo-1)*pageSize , pageSize;
SELECT employee_id,last_name,salary, department_id
FROM employees 
LIMIT 0,20;

SELECT employee_id,last_name,salary, department_id
FROM employees 
LIMIT 20,20;

SELECT employee_id,last_name,salary, department_id
FROM employees 
LIMIT 40,20;

# WHERE ORDER BY LIMIT 声明顺序
SELECT employee_id,last_name,salary, salary 
FROM employees 
WHERE salary >6000
ORDER BY salary DESC 
LIMIT 2,32;

#LIMIT...  OFFSET...
SELECT employee_id,last_name,salary, salary 
FROM employees 
WHERE salary >6000
ORDER BY salary DESC 
LIMIT 32 OFFSET 2;