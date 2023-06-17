CREATE DATABASE IF NOT EXISTS test01_library CHARACTER SET 'utf8';

USE test01_library;

CREATE TABLE IF NOT EXISTS books ( 
id INT,
`name` VARCHAR (50),
`authors` VARCHAR (100), 
price FLOAT,
pubdate YEAR,
note VARCHAR (100), 
num INT
);

DESC books;

INSERT INTO books
VALUES (1, 'Tal of AAA', 'Dickes', 23, '1995', 'novel', 11);
INSERT INTO books(id,name,authors,price,pubdate,note,num)
VALUES(2, 'EmmaT', 'Jane lura', 35, '1993', 'joke' , 22);

INSERT INTO books (id,name,authors,price,pubdate,note,num)
VALUES
(3, 'Story of Jane', 'Jane Tim', 40,2001, 'novel', 0),
(4, 'Lovey Day', 'George Byron', 20, 2005, 'novel', 30),
(5, 'Old land','Honore Blade', 30,2010, 'Law', 0),
(6,'The Battle', 'Upton Sara', 30,1999, 'medicine', 40),
(7,'Rose Hood', 'Richard haggard', 28,2008, 'cartoon', 28);

UPDATE books SET price=price+5
WHERE note = 'novel';

UPDATE books
SET price = 40, note = 'drama'
WHERE NAME ='EmmaT';

DELETE FROM books 
WHERE num=0;

DELETE FROM books 
WHERE id>0;

SELECT * FROM books;

SELECT NAME FROM books
WHERE NAME LIKE '%a%';

SELECT COUNT(*), SUM(num)
FROM books
WHERE NAME LIKE '%a%';

SELECT NAME, note, price
FROM books
WHERE note = 'novel'
ORDER BY price DESC;

SELECT *
FROM books
ORDER BY num DESC, note ASC;

SELECT note, COUNT(*)
FROM books
GROUP BY note;

SELECT note, SUM(num)
FROM books
GROUP BY note
HAVING SUM(num) > 30;

SELECT * 
FROM books 
LIMIT 5,5;

SELECT note, SUM(num) sum_num
FROM books
GROUP BY note
ORDER BY sum_num DESC
LIMIT 0,1;

SELECT NAME 
FROM books
WHERE CHAR_LENGTH(REPLACE (NAME,' ', '')) >= 10;

SELECT NAME "书名", note, CASE note WHEN 'novel' THEN '小说'
									WHEN 'law' THEN '法律'
									WHEN 'medicine' THEN '医药'
									WHEN 'cartoon' THEN '卡通'
									WHEN 'joke' THEN '笑活'
									END "类型"
FROM books;

SELECT NAME AS "书名",num AS "库存", CASE WHEN num > 30 THEN '滞销'
										WHEN num > 0 AND num < 10 THEN '畅销'
										WHEN num = 0 THEN '无货'
										ELSE '正常'
										END "显示状态"
FROM books;

SELECT IFNULL(note,'总库存量') AS note, SUM(num)
FROM books
GROUP BY note WITH ROLLUP;

SELECT IFNULL(note,'总库存量') AS note, COUNT(*)
FROM books
GROUP BY note WITH ROLLUP;

SELECT *
FROM books
ORDER BY num DESC
LIMIT 0,3;

SELECT *
FROM books
ORDER BY pubdate ASC
LIMIT 0,1;

SELECT *
FROM books
WHERE note = 'novel'
ORDER BY price DESC
LIMIT 0,1;

SELECT *
FROM books
ORDER BY CHAR_LENGTH(REPLACE (NAME,' ', '')) DESC 
LIMIT 0,1;