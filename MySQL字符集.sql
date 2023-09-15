#查看GBK字符集的比较规则
SHOW COLLATION LIKE 'gbk%';

#查看UTF-8字符集的比较规则
SHOW COLLATION LIKE 'utf8%';

#查看服务器的字符集和比较规则
SHOW VARIABLES LIKE '§_server';
#查看数据库的宇符集和比较规则
SHOW VARIABLES LIKE '%_database';
#查看具体数据库的字符集
SHOW CREATE DATABASE dbtest1;
#修改具体数据库的字符集
ALTER DATABASE dbtest1 DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

USE dbtest1;
#查看表的字符集
SHOW CREATE TABLE employees;
#查看表的比较规则
SHOW TABLE STATUS FROM atguigudb LIKE 'employees';
#修改表的宇符樂和比较规则
ALTER TABLE employees DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

SELECT @@session.sql_mode;

