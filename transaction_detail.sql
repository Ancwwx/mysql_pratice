INSERT INTO t27 VALUES(300,'milan');
SELECT * FROM t27;
START TRANSACTION;
INSERT INTO t27 VALUES(400,'king');
INSERT INTO t27 VALUES(500,'scott');
ROLLBACK;
COMMIT;
SET AUTOCOMMIT=OFF;