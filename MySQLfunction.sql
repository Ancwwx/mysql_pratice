#单行函数
#1.数值函数
#ABS:绝对值   SIGN:判断正负数   PI:派    CEIL,CEILING:天花板数     FLOOR:地板数    MOD:取模
SELECT ABS(-123),ABS(123),SIGN(-23),SIGN(43),PI(),CEIL(32.32),CEILING (-43.23),FLOOR(32.32),
FLOOR(-43.23),MOD(12,5)
FROM DUAL;

#RAND:随机数
SELECT RAND(),RAND(),RAND(10),RAND(10),RAND(-1),RAND(-1)
FROM DUAL;

#四舍五入，截断操作
SELECT ROUND(123.556),ROUND(123.456,0),ROUND(123.456,1),ROUND(123.456,-1)
FROM DUAL;

SELECT TRUNCATE(123.456,0),TRUNCATE(123.456,1),TRUNCATE(129.45,-1)
FROM DUAL;

SELECT TRUNCATE(ROUND(123.456,2),0)
FROM DUAL;

#开方
SELECT SQRT(25)
FROM DUAL;


#角度与弧度的互换
#RADIANS角度转化为弧度
SELECT RADIANS(30),RADIANS(45),RADIANS(60),RADIANS(90)
FROM DUAL;

#DEGREES弧度转化为角度
SELECT DEGREES(2*PI()),DEGREES(RADIANS(60))
FROM DUAL;

#三角函数
SELECT SIN(RADIANS(30)),DEGREES(ASIN(1)),TAN(RADIANS(45)),DEGREES(ATAN(1))
FROM DUAL;

#指数和对数
SELECT POW(2,5),POWER(2,4),EXP(2)
FROM DUAL;
SELECT LN(EXP(2)),LOG(EXP(2)),LOG10(10),LOG2(4)
FROM DUAL;

#进制间的转换
SELECT BIN(10),HEX(10),OCT(10),CONV(10,2,8)
FROM DUAL;


#字符串函数
SELECT ASCII('Abcdef') 
FROM DUAL;

#CHAR_LENGTH 字符的大小  LENGTH:字节的大小
SELECT CHAR_LENGTH('hello'),CHAR_LENGTH('我们'),LENGTH ('hello'),LENGTH ('我们')
FROM DUAL;

SELECT CONCAT(emp.last_name,'work for',mgr.last_name) "details"
FROM employees emp JOIN employees mgr
WHERE emp.manager_id =mgr.employee_id ;

SELECT CONCAT_WS('_','hello','world','hello','beijing')
FROM DUAL;

#INSERT替换 从1开始
SELECT INSERT ('helloworld',2,3,'aaaaa'),REPLACE('hello','ll','mmm')
FROM DUAL;

#替换大小写
SELECT UPPER('Hello'),LOWER('Hello')
FROM DUAL;

SELECT LEFT('hello',2),RIGHT('hello',3)
FROM DUAL;

#左对齐，右对齐
#LPAD右对齐效果
SELECT employee_id,last_name,LPAD(salary,10,' ')
FROM employees ;
#RPAD左对齐效果
SELECT employee_id,last_name,RPAD(salary,10,' ')
FROM employees ;

#首尾去除
SELECT TRIM('    h  el  lo      ')
FROM DUAL;
#去左
SELECT LTRIM('    h  el  lo      ')
FROM DUAL;
#去右
SELECT RTRIM('    h  el  lo      ')
FROM DUAL;

#去除首尾
SELECT TRIM('o'FROM 'ooheoollo')
FROM DUAL;

#重复 加空格
SELECT REPEAT('hello',4),SPACE (5)
FROM DUAL;

#比较大小 得-1后面的大，1前面的大，0一样大
SELECT STRCMP('abc','abd')
FROM DUAL;

#从哪取到哪
SELECT SUBSTR('hello',2,2)
FROM DUAL;

SELECT LOCATE('ll','hello')
FROM DUAL;

SELECT ELT(2,'a','b','c','d')
FROM DUAL;

SELECT FIELD('mm','gg','dd','mm','jj','mm'),FIND_IN_SET('mm','gg,dd,jj,mm,ss,mm') 
FROM DUAL;

#反转
SELECT REVERSE('ABC')
FROM DUAL;

#null 两者相等 不等则返回前者长度
SELECT employee_id,NULLIF(LENGTH(first_name),LENGTH(last_name)) "compare"
FROM employees ;