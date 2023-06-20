/*
• not null（非空約束）
• unique  (唯一性约束）
• primary key（主鍵約束）
• foreign key（外鍵約束）
• check    （检查約束）
• default （默认值约束）
*/

#．如何查看表中的约束
SELECT * FROM information_schema.table_constraints
WHERE table_name ='employees';

CREATE DATABASE dbtest13;
USE dbtest13;
# not null（非空約束）
#在CREATE TABLE时添加约束
CREATE TABLE test1( 
id INT NOT NULL,
last_name VARCHAR (15) NOT NULL, 
email VARCHAR (25), 
salary DECIMAL (10, 2)
);

DROP TABLE test1;

INSERT INTO test1(id,last_name,email,salary)
VALUES(1,'Tom','tom`126.com',3400);

SELECT * FROM test1;

#增加约束
ALTER TABLE test1 
MODIFY email VARCHAR(25) NOT NULL;

#删除约束
ALTER TABLE test1 
MODIFY email VARCHAR(25) NULL;

DESC test1;

#UNIQUE唯一约束
CREATE TABLE test2( 
id INT UNIQUE, #列级约束 
last_name VARCHAR (15) , 
email VARCHAR (25) , 
salary DECIMAL (10, 2),
CONSTRAINT uk_test2_email UNIQUE(email)
);
SELECT * FROM information_schema.table_constraints
WHERE table_name ='test2';

#可以向声明为unique的字段上添加null值,并且可以多次添加null
INSERT INTO test2(id,last_name,email,salary)
VALUES(1,'Tom','tom`126.com',4200);

INSERT INTO test2(id,last_name,email,salary)
VALUES(2,'Tom1',NULL,3400);

SELECT * FROM test2;

DESC test2;

#在ALTER TABLE时添加約束
ALTER TABLE test2
ADD CONSTRAINT uk_test2_sal UNIQUE (salary);

ALTER TABLE test2
MODIFY last_name VARCHAR (15) UNIQUE;

#复合的唯一性约束
CREATE TABLE USER ( 
id INT,
name VARCHAR (15),
password VARCHAR (25),
CONSTRAINT uk_user_name_pwd UNIQUE (name, password)
);
INSERT INTO USER
VALUES(1,'Tom','abc');
INSERT INTO USER
VALUES(1,'Tom1','abc');

SELECT * FROM USER;

DESC test2;

#如何刪除唯一性索引
ALTER TABLE test2
DROP INDEX last_name;
ALTER TABLE test2
DROP INDEX uk_test2_sal;