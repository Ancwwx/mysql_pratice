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
