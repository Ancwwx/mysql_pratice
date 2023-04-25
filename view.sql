CREATE VIEW emp_view01 AS SELECT empno,ename,job,deptno FROM emp;
DESC emp_view01;
SELECT * FROM emp_view01;
SELECT empno,job FROM emp_view01;
SHOW CREATE VIEW emp_view01;
DROP VIEW emp_view01;


UPDATE emp_view01 SET job='MANAGER' WHERE empno=7369;
SELECT * FROM emp;

UPDATE emp SET job='SALESMAN' WHERE empno=7369;

DESC emp_view01;

CREATE VIEW emp_view02 AS SELECT empno,ename FROM emp_view01;
DESC emp_view02 ;
SELECT * FROM emp_view02;
