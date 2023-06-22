CREATE DATABASE test04_emp;
USE test04_emp;
CREATE TABLE emp2 ( 
id INT,
emp_name VARCHAR (15)
);
CREATE TABLE dept2 ( id INT,
dept_name VARCHAR (15)
);

ALTER TABLE emp2 
ADD PRIMARY KEY(id);

ALTER TABLE dept2
ADD PRIMARY KEY(id);

ALTER TABLE emp2
ADD dept_id INT;

DESC emp2;

ALTER TABLE emp2
ADD CONSTRAINT fk_emp2_deptid FOREIGN KEY (dept_id) REFERENCES dept2 (id);