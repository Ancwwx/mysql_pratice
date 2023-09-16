#索引的创建

CREATE DATABASE dbtest2;

USE dbtest2;

CREATE TABLE dept(dept_id INT PRIMARY KEY AUTO_INCREMENT,
                  dept_name VARCHAR(20));


CREATE TABLE emp(emp_id INT PRIMARY KEY AUTO_INCREMENT,
                 emp_name VARCHAR(20) UNIQUE,
                 dept_id INT,
                 CONSTRAINT emp_dept_id_fk FOREIGN KEY(dept_id) REFERENCES dept(dept_id));
                
CREATE TABLE book(book_id INT , book_name VARCHAR(100),
				  AUTHORS VARCHAR(100), 
				  info VARCHAR(100) ,
				  COMMENT VARCHAR(100), 
				  year_publication YEAR,
				  #声明索引
				  INDEX idx_bname(book_name)
				  );
#通过命令查看索引
#方式1
SHOW CREATE TABLE book; 

#方式2
SHOW INDEX FROM book;

CREATE TABLE book1( book_id INT, book_name VARCHAR(100),
AUTHORS VARCHAR(100), info VARCHAR(100) , COMMENT VARCHAR(100), year_publication YEAR,
UNIQUE INDEX uk_idx_cmt(COMMENT)
);
SHOW INDEX FROM book1;

#通过定义主键约束的方式定义主键索引
CREATE TABLE book2( book_id INT PRIMARY KEY AUTO_INCREMENT, book_name VARCHAR(100),
AUTHORS VARCHAR(100), info VARCHAR(100) ,
COMMENT VARCHAR(100), year_publication YEAR
);

SHOW INDEX FROM book2;

#通过删除主键约束的方式删除主键索引
ALTER TABLE book2 
DROP PRIMARY KEY;

#声明索引
UNIQUE INDEX idx_bname(book_name));

#表已经创建成功的情况下
CREATE TABLE book5( book_id INT , book_name VARCHAR(100),
AUTHORS VARCHAR(100), info VARCHAR(100) ,
COMMENT VARCHAR(100), year_publication YEAR
);

ALTER TABLE book5 ADD INDEX idx_cmt(COMMENT);

ALTER TABLE book5 ADD UNIQUE uk_idx_bname(book_name);

ALTER TABLE book5 ADD INDEX nul_bid_bname_info(book_id,book_name,info);

SHOW INDEX FROM book5;

CREATE TABLE book6( book_id INT , book_name VARCHAR(100),
AUTHORS VARCHAR(100), info VARCHAR(100) ,
COMMENT VARCHAR(100), year_publication YEAR
);

CREATE INDEX idx_cmt ON book6(COMMENT);

CREATE UNIQUE INDEX uk_idx_cmt ON book6(book_name);

CREATE INDEX nul_bid_bname_info ON book6 (book_id,book_name,info);







