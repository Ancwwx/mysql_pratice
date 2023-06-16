#DCL 中 COMMIT 和 ROLLBACK
# COMMIT:提交数据。一旦执行COMMIT，则数据就被水久的保存在了数据库中，意味者数据不可以回滚
#ROLLBACK:回滚数据。一旦执行ROLLBACK，则可以实现数据的回滚，回滚到最近的一次COMMIT之后

# 対比 TRUNCATE TABLE 和 DELETE FROM
# 相同点：都可以实现对表中所有数据的删除，同时保留表结构。
# 不同点:
#      TRUNCATE TABLE:一旦执行此操作，表数据全部清除。同时，数据是不可以回滚的。
#      DELETE FROM：一旦执行此操作，表数据可以全部清除（不带WHERE）。同时，数据可以实现回滚

/*
 * DDL和DML的说明
 *  DDL的操作一旦执行，就不可以回滚。
 *  DML的操作默认情况下，一旦执行，也是不可以回滚的，但是，如果在执行DML之前，执行了
 *      SET autocommit = FALSE，则执行的DML操作就可以实现回滚。 
 */

#演示：DELETE FROM 
COMMIT;

SELECT * FROM myemp3;

SET autocommit = FALSE ;

DELETE FROM myemp3;

ROLLBACK;

#测试MysQL8.0的新特性：DDL的原子化
CREATE DATABASE mytest;

USE mytest;

CREATE TABLE book1 ( book_id INT , book_name VARCHAR (255)) ;

SHOW TABLES;

DROP TABLE book1,book2;

