CREATE INDEX empno_index ON emp_(ename);
SELECT *FROM emp_ WHERE ename='SMITH';


CREATE TABLE t26(id INT,
                `name` VARCHAR(32)); 
SHOW INDEXES FROM t26;
CREATE UNIQUE INDEX id_index ON t26(id);
CREATE INDEX id_index ON t26(id);

ALTER TABLE t26 ADD INDEX id_index(id);

ALTER TABLE t26 ADD PRIMARY KEY (id);

DROP INDEX id_index ON t26;

ALTER TABLE t26 DROP PRIMARY KEY;

SHOW INDEX FROM t26;
SHOW INDEXES FROM t26;
SHOW KEYS FROM t25;
DESC t25;