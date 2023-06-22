#primary key(唯一约束+非空约束的组合)
#主键约束特征：非空且唯一，用于唯一的标识表中的一条记录。
USE dbtest13;
CREATE TABLE test4 (
id INT PRIMARY KEY,#列級約束
last_name VARCHAR (15), salary DECIMAL (10, 2),
email VARCHAR (25)
);

CREATE TABLE test5 ( 
id INT,
last_name VARCHAR (15), 
salary DECIMAL (10, 2), 
email VARCHAR (25),
#表级约束
CONSTRAINT pk_test5_id PRIMARY KEY (id) #没有必要起名字
);

#MySQL的主键名总是PRIMARY，就算自己命名了主键约束名也没用。
SELECT * FROM information_schema.table_constraints
WHERE table_name ='test4';

SELECT * FROM information_schema.table_constraints
WHERE table_name ='test5';

INSERT INTO test4 (id, last_name, salary, email)
VALUES (1, 'Tom', 4500, 'tom@126.com');
SELECT * FROM test4;

CREATE TABLE user1 ( 
id INT, 
NAME VARCHAR (15),
PASSWORD VARCHAR (25) ,
PRIMARY KEY (NAME, PASSWORD)
);

#如果是多列组合的复合主键约束，那么这些列都不允许为空值，并且组合的值不允许重复。
INSERT INTO user1
VALUES (1, 'Tom', 'abc');
INSERT INTO user1
VALUES (1, 'Tom1', 'abc');

SELECT * FROM user1;

#在ALTER TABLE时添加主键約束
CREATE TABLE test6 (
id INT ,
last_name VARCHAR (15), salary DECIMAL (10, 2),
email VARCHAR (25)
);

DESC test6;
ALTER TABLE test6
ADD PRIMARY KEY (id);

#如何删除主键约束
ALTER TABLE test6
DROP PRIMARY KEY;