SELECT * FROM emp;
SELECT * FROM emp WHERE ename NOT LIKE '%R%' ;
SELECT SUBSTRING(ename,1,3)  FROM emp;
SELECT LEFT(ename,3)  FROM emp;
SELECT REPLACE (ename,'A','a') FROM emp;

SELECT ename,hiredate  FROM emp WHERE DATE_ADD(hiredate,INTERVAL 10 YEAR)<=NOW() ;
SELECT *  FROM emp ORDER BY ename;
SELECT ename,hiredate  FROM emp ORDER BY hiredate;
SELECT ename,job,sal  FROM emp ORDER BY job DESC,sal;
SELECT ename,CONCAT(YEAR(hiredate),'-',MONTH(hiredate))FROM emp ORDER BY MONTH(hiredate),YEAR(hiredate) ;

SELECT ename,FLOOR(sal/30)  FROM emp ;
SELECT ename,ROUND(sal/30)  FROM emp ;

SELECT *  FROM emp WHERE MONTH(hiredate)=2;

SELECT ename,DATEDIFF(NOW(),hiredate) FROM emp; 
SELECT * FROM emp WHERE ename LIKE '%A%' ;

SELECT ename,CONCAT(FLOOR(DATEDIFF(NOW(),hiredate)/365),'年', FLOOR((DATEDIFF(NOW(),hiredate)%365)/31),'月',DATEDIFF(NOW(),hiredate)%31,'日')  FROM emp; 











