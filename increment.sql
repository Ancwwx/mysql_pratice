CREATE TABLE t24 (id INT PRIMARY KEY AUTO_INCREMENT,
                 email VARCHAR(32) NOT NULL DEFAULT '',
                 `name` VARCHAR(32) NOT NULL DEFAULT'');
DESC t24;
INSERT INTO t24 VALUES(NULL,'jack@yahoo.com','jack');
INSERT INTO t24 VALUES(NULL,'tom@yahoo.com','tom');
DROP  TABLE t24;

INSERT INTO t24 (email,`name`)VALUES('sp@yahoo.com','sp');
SELECT * FROM t24

CREATE TABLE t25 (id INT PRIMARY KEY AUTO_INCREMENT,
                 email VARCHAR(32) NOT NULL DEFAULT '',
                 `name` VARCHAR(32) NOT NULL DEFAULT'');
ALTER TABLE t25 AUTO_INCREMENT =100;
SELECT * FROM t25;
INSERT INTO t25 VALUES(NULL,'tom@qq.com','tom');
INSERT INTO t25 VALUES(666,'mary@qq.com','mary');
