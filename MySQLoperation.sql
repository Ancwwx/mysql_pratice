SELECT * FROM employees;

SELECT 100,100+0,100-0,100+50,100+50-30,100+35.5,100-35.5
FROM DUAL;

SELECT 100+'1'
FROM DUAL;

SELECT 100+'a'
FROM DUAL;

SELECT 100 + NULL
FROM DUAL;

SELECT 100,100*1,100*1.0,100/1.0,100/2,100+2*5/2,100/3,100 DIV 0
FROM DUAL;

# 取模运算
SELECT 12 % 3,12 % 5,12 MOD -5,-12%5,-12%-5
FROM DUAL;

SELECT employee_id,last_name ,salary 
FROM employees 
WHERE employee_id % 2=0;

#字符串存在隐式转换。如果转换数值不成功，则看作0
SELECT 1=2,1 != 2 ,1='1',1='a',0='a'
FROM DUAL;

#两边都是字符串，则按照ANSI的比较规则进行比较
SELECT 'a'='a','ab'='ab','a'='b'
FROM DUAL;

#只要有null参与判断，结果就为null
SELECT 1=NULL FROM DUAL;
SELECT NULL=NULL FROM DUAL;

SELECT last_name,salary,commission_pct 
FROM employees 
# WHERE salary = 6000;
WHERE commission_pct =NULL;

SELECT 1 <=> 2,1 <=> '1',1 <=> 'a',0 <=>'a'
FROM DUAL;

#查询表中commission_pct为null的数据有哪些
SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct <=> NULL;

# <=> 两边都是null，返回结果是1
SELECT 1 <=> NULL,NULL <=> NULL 
FROM DUAL;

#is null \ is not null \ isnull
SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct IS NULL;

SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct IS NOT NULL;

#查询表中commission_pct不为null的数据有哪些(两种方法)
SELECT last_name,salary,commission_pct 
FROM employees 
WHERE ISNULL (commission_pct);

SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct <=> NULL;

# 最小 LEAST() \ 最大 GREATEST
SELECT LEAST('g','b','t','m'), GREATEST('g','b','t','m')
FROM DUAL;

SELECT first_name ,last_name , LEAST(first_name,last_name),LEAST(LENGTH (first_name),LENGTH (last_name))
FROM employees;

#BETWEEN ... AND...(范围包含边界数字)
SELECT employee_id,last_name,salary
FROM employees 
WHERE salary BETWEEN 6000 AND 8000;

SELECT employee_id,last_name,salary
FROM employees 
WHERE salary >= 6000 && salary <= 8000;

SELECT employee_id,last_name,salary
FROM employees 
WHERE salary NOT BETWEEN 6000 AND 8000;

#IN (set) \ NOT IN (set)
SELECT last_name,salary,department_id
FROM employees 
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;

SELECT last_name,salary,department_id
FROM employees 
WHERE department_id IN (10,20,30);

SELECT last_name,salary,department_id
FROM employees 
WHERE salary NOT IN(6000,7000,8000);

# LIKE:模糊查询 %代表不确定个数的字符(0~多个)
SELECT last_name
FROM employees 
WHERE last_name LIKE '%a%';

SELECT last_name
FROM employees 
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

# _:代表一个不确定的字符
SELECT last_name
FROM employees 
WHERE last_name LIKE '_a%';

#转义字符 
#查询第二个字符是_ 且第三个字符是a的员工信息
SELECT last_name
FROM employees 
WHERE last_name LIKE '_\_a%';

SELECT last_name
FROM employees 
WHERE last_name LIKE '_$_a%' ESCAPE '$';

#REGEXP \ RLIKE :正则表达式
SELECT 'shkstart' REGEXP '^sh','shkstart' REGEXP 't$','shkstart' REGEXP 'hk'
FROM DUAL;

SELECT 'atguigu' REGEXP 'gu.gu','atguigu' REGEXP '[ab]'
FROM DUAL;

#逻辑运算符 OR || AND && NOT ! XOR:逻辑异或  注意：and优先级高于or
SELECT last_name,salary,department_id
FROM employees 
#WHERE department_id = 10 OR department_id = 20;
WHERE department_id = 50 AND salary >6000;

SELECT last_name,salary,department_id
FROM employees 
#WHERE salary NOT BETWEEN 6000 AND 8000 ;
#WHERE commission_pct IS NOT NULL;
WHERE commission_pct <=> NULL;

#XOR 满足前项，不满足后项 或者 满足后项，不满足前项
SELECT last_name,salary,department_id
FROM employees 
WHERE department_id = 50 XOR salary >6000;

#位运算符: 按位与$  按位或| 按位异或^  取反~ << >>
SELECT 12 & 5 , 12 | 5 , 12 ^ 5 
FROM DUAL;

SELECT 10 & ~1 FROM DUAL;

#在一定范围内满足：每向左移动1位，相当于乘以2；每向右移动以为，相当于除以2
SELECT 4<<1,8>>1
FROM DUAL;



