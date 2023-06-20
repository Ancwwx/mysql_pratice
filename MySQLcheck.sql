#check 約束
# MySQL5.7 不支持CHECK約束，MySQL8.0支持CHECK約束。
CREATE TABLE test10 ( 
id INT, 
last_name VARCHAR (15),
salary DECIMAL (10,2) CHECK (salary > 2000)
) ;
INSERT INTO test10
VALUES(1,'Tom',2500);


