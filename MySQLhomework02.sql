SELECT e.last_name , e.department_id , d.department_name
FROM employees e LEFT JOIN departments d 
ON e.department_id =d.department_id ;

SELECT e.job_id,d.location_id
FROM employees e JOIN departments d 
ON e.department_id =d.department_id 
WHERE d.department_id =90;

SELECT e.last_name,e.commission_pct,d.department_name,d.location_id,l.city
FROM employees e LEFT JOIN departments d 
ON e.department_id =d.department_id 
LEFT JOIN locations l 
ON d.department_id =l.location_id 
WHERE e.commission_pct IS NOT NULL;