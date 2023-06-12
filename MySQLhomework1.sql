SELECT last_name,department_id,salary*12 annual_salary
FROM employees 
ORDER BY annual_salary DESC ,last_name ASC ;

SELECT last_name,salary
FROM employees 
WHERE salary <8000 OR salary >17000
ORDER BY salary DESC 
LIMIT 20,20;

SELECT last_name,salary
FROM employees 
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC 
LIMIT 20,20;

SELECT employee_id ,email,last_name,salary
FROM employees 
#WHERE email REGEXP '[e]'
WHERE email  LIKE '%e%'
ORDER BY LENGTH(email) DESC,department_id;
