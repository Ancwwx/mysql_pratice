#DEFAULT约束
CREATE TABLE test11 (
id INT ,
last_name VARCHAR(15),
salary DECIMAL(10, 2) DEFAULT 2000
);

DESC test11;

INSERT INTO test11 (id, last_name, salary)
VALUES (1, 'Tom', 3000);
INSERT INTO test11 (id, last_name)
VALUES (1, 'Tom1');
SELECT *
FROM test11;

#在ALTER TABLE添加约束
CREATE TABLE test12 (
id INT ,
last_name VARCHAR(15),
salary DECIMAL(10, 2) 
);

DESC TABLE test12;

ALTER TABLE test12
MODIFY salary DECIMAL(8,2) DEFAULT 2500;

#在ALTER TABLE删除约束
ALTER TABLE test12
MODIFY salary DECIMAL(8,2);