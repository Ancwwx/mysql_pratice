# 流程控制函数
SELECT last_name,salary,IF(salary >= 6000,'高工资','低工资') "details"
FROM employees ;

SELECT  last_name,commission_pct,
IF(commission_pct IS NOT NULL,commission_pct,0) "details"
FROM employees;

SELECT  last_name,commission_pct,
IFNULL(commission_pct,0) "details"
FROM employees;

#CASE WHEN...THEN
SELECT last_name,salary,CASE WHEN salary>=15000 THEN '高薪'
                             WHEN salary>=10000 THEN '中薪'
                             WHEN salary>=8000 THEN '低薪'
                             ELSE '贫困' END "details" ,department_id 
FROM employees ;

SELECT employee_id ,last_name,department_id ,salary,CASE department_id WHEN 10 THEN salary *1.1
                                                                       WHEN 20 THEN salary *1.2
                                                                       WHEN 30 THEN salary *1.3
                                                                       ELSE salary * 1.4 END "details"
FROM employees ;

SELECT employee_id ,last_name,department_id ,salary,CASE department_id WHEN 10 THEN salary *1.1
                                                                       WHEN 20 THEN salary *1.2
                                                                       WHEN 30 THEN salary *1.3
                                                                       END "details"
FROM employees 
WHERE department_id IN (10,20,30);


SELECT md5('mysql'),SHA('mysql')
FROM DUAL;

SELECT VERSION (), CONNECTION_ID (), DATABASE (), SCHEMA (),
USER() , CURRENT_USER(), CHARSET("尚硅谷"),COLLATION("尚硅谷")
FROM DUAL;

#其他函数
SELECT FORMAT(123.125,2),FORMAT(123.125,0),FORMAT(123.125,-2)
FROM DUAL;

SELECT CONV (16, 10, 2), CONV (8888,10,16), CONV (NULL, 10, 2)
FROM DUAL;

SELECT INET_ATON ('192.168.1.100'), INET_NTOA (3232235876)
FROM DUAL;

#BENCHMARK()用于测试表达式的执行效率
SELECT BENCHMARK (10000,MD5 ('mysql '))
FROM DUAL;

# CONVERT():可以实现字符集的转换
SELECT CHARSET ('atguigu'), CHARSET(CONVERT ('atguigu' USING 'utf8mb3'))
FROM DUAL;



