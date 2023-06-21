#foreign key
#在CREATE TABLE 时添加
#主表和从表; 父表和子表
#先创建主表
CREATE TABLE dept1 ( 
dept_id INT , 
dept_name VARCHAR (15)
);
#再创建从表
CREATE TABLE emp1 (
emp_id INT PRIMARY KEY AUTO_INCREMENT, 
emp_name VARCHAR (15), 
department_id INT,
#表级约束
CONSTRAINT fk_emp1_dept_id FOREIGN KEY (department_id) REFERENCES dept1(dept_id)
);

ALTER TABLE dept1 
ADD PRIMARY KEY(dept_id);

DESC dept1;
DESC emp1;

#演示外键效果
INSERT INTO dept1
VALUES (10, 'IT');

INSERT INTO emp1
VALUES (1001, 'Tom', 10);

CREATE TABLE dept2( 
dept_id INT PRIMARY KEY, 
dept_name VARCHAR (15)
);

CREATE TABLE emp2 (
emp_id INT PRIMARY KEY AUTO_INCREMENT, 
emp_name VARCHAR (15), 
department_id INT
);
#在ALTER TABLE时添加外键约束
ALTER TABLE emp2 
ADD CONSTRAINT fk_emp2_dept_id FOREIGN KEY(department_id) REFERENCES dept2(dept_id);

#关于外键约束，最好采用 OT UPDATE CASCADE ON DELETE RESTRICT 的方式。 （更新的时候同步更新，删除的时候，子表变成null)

#删除外键约束
ALTER TABLE emp1
DROP FOREIGN KEY fk_emp1_dept_id;

#再手动的删除外键约束对应的普通索引
SHOW INDEX FROM emp1;
ALTER TABLE emp1
DROP INDEX fk_emp1_dept_id;