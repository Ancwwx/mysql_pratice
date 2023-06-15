SELECT salary
FROM employees
WHERE last_name = 'Abel';
SELECT last_name, salary
FROM employees
WHERE salary > 11000;

SELECT e2.last_name,e2.salary
FROM employees e1,employees e2
WHERE e2.salary > e1.salary 
AND e1.last_name ='Abel';

#子查询
SELECT last_name, salary
FROM employees
WHERE salary > (
                SELECT salary
                FROM employees
                WHERE last_name = 'Abel');

#单行子查询
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (
				SELECT salary
				FROM employees
				WHERE employee_id = 149
				) ;
		
SELECT last_name,job_id, salary
FROM employees
WHERE job_id = (
				SELECT job_id
				FROM employees
				WHERE employee_id = 141
				)
AND salary > (
				SELECT salary
				FROM employees
				WHERE employee_id = 143
				);
			
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
				SELECT MIN(salary)
				FROM employees
				);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE manager_id = (
					SELECT manager_id
					FROM employees
					WHERE employee_id = 141
					)
AND department_id = (
					SELECT department_id
					FROM employees
					WHERE employee_id = 141
					)
AND employee_id <> 141;

#HAVING中的子查询
SELECT department_id, MIN(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING MIN(salary) > (
					  SELECT MIN(salary)
					  FROM employees
					  WHERE department_id = 50
					  );
					 
#CASE中的子查询
SELECT employee_id, last_name, CASE department_id WHEN (SELECT department_id FROM departments WHERE location_id = 1800) THEN "Canada"
																														ELSE 'USA' END "location"
FROM employees;


#多行子查询
# 多行子査面的操作符:IN ANY ALI SOME (ANY)
#挙例：
#IN:
SELECT employee_id, last_name
FROM employees 
WHERE salary IN
				(SELECT MIN(salary) 
				FROM employees
				GROUP BY department_id);
#ANY / ALL
SELECT employee_id, last_name,job_id, salary
FROM employees
WHERE job_id <> 'IT_PROG' AND salary < ANY (
											SELECT salary
											FROM employees
											WHERE job_id = 'IT_PROG'
											);
										
SELECT employee_id, last_name,job_id, salary
FROM employees
WHERE job_id <> 'IT_PROG' AND salary < ALL (
											SELECT salary
											FROM employees
											WHERE job_id = 'IT_PROG'
											);
										
										
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (
					SELECT MIN(avg_sal)
					FROM (
					SELECT AVG(salary) avg_sal
					FROM employees
					GROUP BY department_id ) t_dept_avg_sal
					);
				
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL (
					SELECT AVG(salary) avg_sal
					FROM employees
					GROUP BY department_id 
					);

#相关子查询
SELECT last_name, salary, department_id
FROM employees e1
WHERE salary > (
				SELECT AVG(salary)
				FROM employees e2
				WHERE department_id = e1. department_id
				);					 
SELECT e.last_name,e.salary, e.department_id
FROM employees e, (
					SELECT department_id,AVG(salary) avg_sal
					FROM employees
					GROUP BY department_id) t_dept_avg_sal
WHERE e.department_id = t_dept_avg_sal.department_id
AND e.salary > t_dept_avg_sal.avg_sal;

SELECT employee_id, salary
FROM employees e 
ORDER BY (
    	 SELECT department_name
		 FROM departments d
		 WHERE e.department_id = d.department_id
		 ) ASC;
	
SELECT employee_id, last_name, job_id
FROM employees e
WHERE 2 <= (
			SELECT COUNT(*)
			FROM job_history j
			WHERE e.employee_id = j.employee_id
			);

		
#自连接
SELECT DISTINCT mgr.employee_id,mgr.last_name,mgr.job_id, mgr.department_id
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

#子查询
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE employee_id IN (
			SELECT DISTINCT manager_id
			FROM employees
			);
			
#使用EXISTS :满足条件返回true
SELECT employee_id, last_name,job_id, department_id
FROM employees e1
WHERE EXISTS (
			SELECT *
			FROM employees e2
			WHERE e1.employee_id = e2.manager_id
			);

#使用NOT EXISTS :满足条件返回false
SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (
					SELECT *
					FROM employees e
					WHERE d.department_id = e.department_id
					);