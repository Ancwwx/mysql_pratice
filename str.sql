SELECT CHARSET(ename) FROM emp;

SELECT * FROM emp;

SELECT CONCAT(ename,' job is ', job) FROM emp;

SELECT  INSTR('hanshunping','ping') FROM DUAL;

SELECT UCASE(ename) FROM emp;

SELECT LCASE(ename) FROM emp;

SELECT LEFT(ename,2) FROM emp;

SELECT RIGHT(ename,2) FROM emp;

SELECT LENGTH('北京') FROM emp;

SELECT ename, REPLACE(job,'MANAGER','经理') FROM emp;

SELECT STRCMP('hsp','jsp') FROM DUAL;

SELECT SUBSTRING(ename,1,2)  FROM emp;

SELECT LTRIM('    北京你好')  FROM DUAL;
SELECT RTRIM('北京你好     ')  FROM DUAL;
SELECT TRIM('    北京你好     ')  FROM DUAL;

SELECT CONCAT(LCASE(LEFT(ename,1)),SUBSTRING(ename,2))  FROM emp; 
SELECT CONCAT(LCASE(SUBSTRING(ename,1,1)),SUBSTRING(ename,2))  FROM emp; 












