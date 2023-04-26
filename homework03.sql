SELECT * FROM emp;
SELECT * FROM emp WHERE deptno =30;
SELECT ename,empno,deptno,job FROM emp WHERE job='CLERK';
SELECT * FROM emp WHERE IFNULL(comm,0)>sal;
SELECT * FROM emp WHERE IFNULL(comm,0)>sal*0.6;
SELECT * FROM emp WHERE (deptno =10 AND job ='MANAGER') OR (deptno =20 AND job='CLERK');
SELECT * FROM emp WHERE (deptno =10 AND job ='MANAGER') OR (deptno =20 AND job='CLERK') OR (job !='MANAGER' AND job!='CLERK' AND sal>=2000) ;
SELECT DISTINCT job FROM emp WHERE comm IS NOT NULL;
SELECT * FROM emp WHERE comm IS NULL OR IFNULL(comm,0)<100;


SELECT * FROM emp WHERE LAST_DAY(hiredate)-hiredate=2;
SELECT * FROM emp WHERE DATE_ADD(hiredate,INTERVAL 12 YEAR)<NOW();


SELECT CONCAT(LCASE(SUBSTRING(ename,1,1)),SUBSTRING(ename,2))  FROM emp ;
SELECT * FROM emp WHERE LENGTH(ename)=5;





