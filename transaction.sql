CREATE TABLE t27( id INT,`name` VARCHAR(32));
START TRANSACTION ;
SAVEPOINT a;

INSERT INTO t27 VALUES(100,'tom');
SAVEPOINT b;
INSERT INTO t27 VALUES(200,'jack');

ROLLBACK TO b;
SELECT * FROM t27;
ROLLBACK TO a;
ROLLBACK;
COMMIT;