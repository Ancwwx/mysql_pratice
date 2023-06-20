#创建数据库时指定字符集
CREATE DATABASE IF NOT EXISTS dbtest12 CHARACTER SET 'utf8';
SHOW CREATE DATABASE dbtest12;

USE dbtest12;
#创建表的吋候，指定表的字符集
CREATE TABLE temp (
id INT
) CHARACTER SET 'utf8';
SHOW CREATE TABLE temp;

#创建表，指名表中的字段时，可以指定字段的字符集
CREATE TABLE temp1 (
id INT,
NAME VARCHAR(15) CHARACTER SET 'gbk'
) ;
SHOW CREATE TABLE temp1;

#整型数据类型
CREATE TABLE test_int1 ( 
f1 TINYINT, 
f2 SMALLINT, 
f3 MEDIUMINT,
f4 INTEGER, 
f5 BIGINT
);

INSERT INTO test_int1 (f1)
VALUES (12), (-12), (-128), (127);
SELECT * FROM test_int1;
DESC test_int1;

CREATE TABLE test_int2 ( f1 INT, f2 INT (5), f3 INT (5) ZEROFILL #显示宽度为5 当不足5位时，用0填充 且当使用zerofull时 自动设置无符号
);
INSERT INTO test_int2 (f1, f2)
VALUES (123,123), (123456, 123456);

INSERT INTO test_int2 (f3)
VALUES (123),(123456);
SELECT * FROM test_int2;

CREATE TABLE test_int3 ( f1 INT UNSIGNED
);
DESC test_int3;
INSERT INTO test_int3
VALUES (2412321);

#浮点类型
#3.浮点类型
CREATE TABLE test_double1 ( 
f1 FLOAT,
f2 FLOAT(5, 2), 
f3 DOUBLE,
f4 DOUBLE(5, 2)
);
DESC test_double1;
INSERT INTO test_double1 (f1, f2)
VALUES (123.45, 123.45);
SELECT * FROM test_double1;
INSERT INTO test_double1 (f3, f4)
VALUES (123.45, 123.456); #存在四舍五入

CREATE TABLE test_double2 ( 
f1 DOUBLE
) ;
INSERT INTO test_double2
VALUES (0.47), (0.44), (0.19) ;
SELECT SUM(f1)
FROM test_double2;
SELECT SUM(f1) = 1.1
FROM test_double2;

CREATE TABLE test_decimall (
f1 DECIMAL,
f2 DECIMAL (5, 2)
);
DESC test_decimall;

INSERT INTO test_decimall (f1)
VALUES(123),(123.45);

SELECT * FROM test_decimall ;

INSERT INTO test_decimall (f2)
VALUES (999.99);
INSERT INTO test_decimall (f2)
VALUES (67.567) ; #存在四舍五入

DROP TABLE test_bit1;
CREATE TABLE test_bit1( 
f1 BIT, 
f2 BIT(5), 
f3 BIT(64)
);
DESC test_bit1;
INSERT INTO test_bit1(f1)
VALUES (0),(1);
SELECT *
FROM test_bit1;
INSERT INTO test_bit1(f2)
VALUES (31);

#BIN()二进制 HEX()十六进制
SELECT BIN(f1) , BIN(f2) , HEX(f1) , HEX(f2)
FROM test_bit1;
#显示十进制
SELECT f1 + 0, f2 + 0
FROM test_bit1;

#YEAR
CREATE TABLE test_year ( 
f1 YEAR, 
f2 YEAR(4)
);
DESC test_year;
INSERT INTO test_year(f1)
VALUES ('2021'), (2022) ;
SELECT * FROM test_year;
INSERT INTO test_year(f1)
VALUES ('2155');

INSERT INTO test_year(f1)
VALUES ('69'),('70');
INSERT INTO test_year(f1)
VALUES (0),('00');

##DATE
CREATE TABLE test_date1 ( 
f1 DATE
);
DESC test_date1;
INSERT INTO test_date1
VALUES ('2020-10-01'), ('20201001'), (20201001);
INSERT INTO test_date1
VALUES ('00-01-01'), ('000101'), ('69-10-01'), ('691001'), ('70-01-01'), ('700101'),('99-01-01'),('990101');
INSERT INTO test_date1
VALUES (000301),(690301), (700301), (990301);
INSERT INTO test_date1
VALUES (CURDATE()) , (CURRENT_DATE()) , (NOW()) ;
SELECT * FROM test_date1 ;

#TIME
CREATE TABLE test_time1( 
f1 TIME
);
DESC test_time1;
INSERT INTO test_time1
VALUES ('2 12:30:29'), ('12:35:29'), ('12:40'), ('2 12:40'), ('1 05'), ('45') ;
INSERT INTO test_time1
VALUES ('123520'),(124011), (1210);
INSERT INTO test_time1
VALUES (NOW()),(CURRENT_TIME());

SELECT * FROM test_time1;

#DATETIME
CREATE TABLE test_datetime1 ( 
dt DATETIME
);
INSERT INTO test_datetime1
VALUES ('2021-01-01 06:50:30'), ('20210101065030');
INSERT INTO test_datetime1
VALUES ('99-01-01 00:00:00'), ('990101000000'), ('20-01-01 00:00:00'), ('200101000000');
INSERT INTO test_datetime1
VALUES (20200101000000), (200101000000), (19990101000000), (990101000000);
INSERT INTO test_datetime1
VALUES (NOW()),(CURRENT_TIMESTAMP()),(SYSDATE());
SELECT * FROM test_datetime1;

#TIMESTAMP
CREATE TABLE test_timestamp1 ( 
ts TIMESTAMP
) ;
INSERT INTO test_timestamp1
VALUES ('1999-01-01 03:04:50'),('19990101030405'), ('99-01-01 03:04:05'), ('990101030405');
INSERT INTO test_timestamp1
VALUES ('2020@01@01@00@00@00'),('20@01@01@00@00@00') ;
INSERT INTO test_timestamp1
VALUES (CURRENT_TIMESTAMP() ) , (NOW() );
SELECT * FROM test_timestamp1;

#对比DATETIME 和 TIMESTAMP 
CREATE TABLE temp_time ( 
d1 DATETIME, 
d2 TIMESTAMP);
INSERT INTO temp_time VALUES ('2021-9-2 14:45:52', '2021-9-2 14:45:52');
INSERT INTO temp_time VALUES (NOW() , NOW() );
SELECT * FROM temp_time;

#修改当前的吋区
SET time_zone ='+8:00';
SELECT * FROM temp_time;

CREATE TABLE test_char1( 
c1 CHAR, 
c2 CHAR (5)
);
DESC test_char1;
INSERT INTO test_char1(c1)
VALUES ('a');
INSERT INTO test_char1(c2)
VALUES ('ab');
INSERT INTO test_char1(c2)
VALUES ('hello');
SELECT * FROM test_char1;

#VARCHAR()内是最大存储字符数

#TEXT类型
CREATE TABLE test_text( 
tx TEXT) ;
INSERT INTO test_text
VALUES ('atguigu');
SELECT CHAR_LENGTH (tx)
FROM test_text; #10

CREATE TABLE test_enum(
season ENUM('春','夏','秋','冬','unknow'));
INSERT INTO test_enum
VALUES('春'),('秋');
INSERT INTO test_enum
VALUES('unknow');

#可以使用索引进行枚举元素的调用
INSERT INTO test_enum
VALUES (1), ('3');

SELECT * FROM test_enum;

INSERT INTO test_enum
VALUES(NULL);

#SET类型
CREATE TABLE test_set 
(S SET ('A','B','C')
);
INSERT INTO test_set (s) VALUES ('A'), ('A,B');

#插入重复的sET类型成员吋，MySQL会白动删除重复的成员
INSERT INTO test_set (s) VALUES ('A,B,C,A');

#向SET类型的字段插入SET成员中不存在的值时，MysQL会拋出错误。
INSERT INTO test_set (s) VALUES ('A,B,C,D');

SELECT *
FROM test_set;

#BINARY 与 VARBINARY类型 按字节存储
CREATE TABLE test_binary1( 
f1 BINARY, 
f2 BINARY (3), 
f3 VARBINARY (10)
);
DESC test_binary1;

INSERT INTO test_binary1(f1, f2)
VALUES ('a','abc');

SELECT * FROM test_binary1;

INSERT INTO test_binary1 (f2,f3)
VALUES ('ab', 'ab');

#Blob类型  存储图片,音频，视频等资源
CREATE TABLE test_blob1 ( 
id INT, 
img MEDIUMBLOB
) ;
INSERT INTO test_blob1 (id)
VALUES (1001);
SELECT *
FROM test_blob1;


#JSON类型
CREATE TABLE test_json ( 
js json
);
INSERT INTO test_json (js)
VALUES ('{"name":"songhk", "age":18, "address": {"province":"beijing", "city":"beijing"}}');
SELECT * FROM test_json;
SELECT js -> '$.name' AS NAME,js -> '$.age' AS age ,js->'$.address.province' AS province, js ->'$.address.city' AS city
FROM test_json;