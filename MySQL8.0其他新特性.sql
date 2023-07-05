#MySQL8.0新特性

CREATE DATABASE dbtest18;
USE dbtest18;

CREATE TABLE sales (
id INT PRIMARY KEY AUTO_INCREMENT, 
city VARCHAR (15),
county VARCHAR(15), 
sales_value DECIMAL);

INSERT INTO sales(city, county, sales_value)
VALUES
('北京','海淀',10.00),
('北京','朝阳',20.00),
('上海','黄埔',30.00),
('上海','长宁',10.00);
SELECT * FROM sales;

CREATE TEMPORARY TABLE a
SELECT SUM(sales_value) AS sales_value
FROM sales;
SELECT * FROM a;
CREATE TEMPORARY TABLE b
SELECT city, SUM(sales_value) As sales_value
FROM sales
GROUP BY city;

SELECT * FROM b;

SELECT s.city AS 城市,s.county AS 区,s.sales_value AS 区销售额,
b.sales_value AS 市銷售額,s.sales_value/b.sales_value AS 市比率,
a.sales_value AS 店销售额,s.sales_value/a.sales_value AS 店比率
FROM sales s
JOIN b ON (s.city=b.city)
JOIN a
ORDER BY s.city,s.county;


#方式二
SELECT city AS 城市,county AS 区, sales_value AS 区销售额,
SUM(sales_value) OVER(PARTITION BY city) AS 市销售额,
sales_value/SUM(sales_value) OVER(PARTITION BY city) AS 市比率,
SUM(sales_value) OVER() AS 总銷售額,
sales_value/SUM(sales_value) OVER () AS 总比率
FROM sales
ORDER BY city, county;



CREATE TABLE employees
AS
SELECT * FROM atguigudb.employees;

SELECT * FROM employees;

#介绍窗口函数


CREATE TABLE departments
AS
SELECT * FROM atguigudb.departments;

#子查询实现
SELECT * FROM departments
WHERE department_id IN (
SELECT DISTINCT department_id
FROM employees
) ;
 
#CTE实现
WITH cte_emp
AS (SELECT DISTINCT department_id FROM employees)
SELECT *
FROM departments d JOIN cte_emp e
ON d.department_id = d.department_id;
