SELECT COUNT(*) AS c ,deptno FROM emp GROUP BY deptno HAVING c>1 ;
SELECT * FROM emp WHERE sal>(
SELECT sal FROM emp WHERE ename='SMITH' );
SELECT worker.ename AS'员工名',worker.hiredate AS '员工入职时间',leader.ename AS '上级名',leader.hiredate AS'上级入职时间' FROM emp worker,emp leader WHERE worker.hiredate >leader.hiredate AND worker.mgr=leader.empno;
SELECT dname,emp.* FROM dept LEFT JOIN emp ON dept.deptno = emp.deptno ;
SELECT ename,dname,job  FROM emp,dept WHERE job='CLERK' AND emp.deptno =dept.deptno ;
SELECT MIN(sal) AS min_sal,job FROM emp GROUP BY job HAVING min_sal >1500;
SELECT ename,dname FROM emp,dept WHERE emp.deptno =dept.deptno AND dname='SALES';
SELECT * FROM emp WHERE sal>(
                      SELECT AVG(sal)FROM emp);
                      
SELECT * FROM emp WHERE job=(
                     SELECT job FROM emp WHERE ename='SCOTT')AND ename != 'SCOTT';
SELECT ename,sal FROM emp WHERE sal>(
                    SELECT MAX(sal) FROM emp WHERE deptno=30);
SELECT COUNT(*) AS '部门员工数量',deptno,AVG(sal)AS'部门平均工资',FORMAT(AVG(DATEDIFF(NOW(),hiredate)/365),2)AS '平均服务期限（年）'FROM emp GROUP BY deptno;                   
SELECT dept.* ,tmp.c FROM dept,(
                     SELECT COUNT(*) AS c ,deptno FROM emp GROUP BY deptno )tmp WHERE dept.deptno =tmp.deptno;
SELECT MIN(sal),job FROM emp GROUP BY job  ;
SELECT MIN(sal),job FROM emp WHERE job='MANAGER'  ;
SELECT ename,(sal+ IFNULL(comm,0))*12 AS'year_sal'FROM emp ORDER BY year_sal;
