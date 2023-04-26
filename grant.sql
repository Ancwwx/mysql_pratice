CREATE  USER 'anc'@'localhost' IDENTIFIED BY '123';
CREATE DATABASE testdb;
CREATE TABLE news(id INT, content VARCHAR(32));
INSERT INTO news VALUES(100,'北京新闻');
SELECT * FROM news;
DROP USER 'anc'@'localhost';
 
GRANT SELECT , INSERT ON testdb.news TO'anc'@'localhost' ;
GRANT UPDATE ON testdb.news TO'anc'@'localhost' ;
SET PASSWORD FOR 'anc'@'localhost'='123'; 

REVOKE SELECT ,UPDATE ,INSERT ON testdb.news FROM'anc'@'localhost';
REVOKE ALL ON testdb.news FROM'anc'@'localhost';

