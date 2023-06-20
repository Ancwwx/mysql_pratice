#自増长列：AUTO_INCREMENT
CREATE TABLE test7 (
id INT PRIMARY KEY AUTO_INCREMENT, 
last_name VARCHAR (15)
);

#当我们向主键（含AUTO_INCREMENT）的字段上添加0或null时，实际上会自动的往上添加指定的数值
INSERT INTO test7 (last_name)
VALUES ('Tom' ) ;
SELECT * FROM test7;

#在ALTER TABLE 时添加
CREATE TABLE test8 ( 
id INT PRIMARY KEY , 
last_name VARCHAR (15)
);
DESC test8;
ALTER TABLE test8
MODIFY id INT AUTO_INCREMENT;

#在ALTER TABLE 时删除
ALTER TABLE test8
MODIFY id INT ;

#MySQL 8.0新特性一自增変量的持久化
