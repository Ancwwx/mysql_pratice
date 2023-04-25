CREATE TABLE t23(id INT PRIMARY KEY, 
                 `name` VARCHAR(32),
                 sex VARCHAR(6) CHECK(sex IN('man','woman')),
                 sal DOUBLE CHECK(sal>1000 AND sal<2000));
INSERT INTO  t23 VALUES(1,'jack','man',1009);
SELECT * FROM t23;
 