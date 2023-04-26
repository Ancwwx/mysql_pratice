CREATE USER 'anc_edu'@'localhost' IDENTIFIED BY '123456';
SELECT `host`,`user`,authentication_string  FROM mysql.user;

DROP USER 'anc_edu'@'localhost';

SET PASSWORD = 'mt123456';

SET PASSWORD FOR 'anc_edu'@'localhost' ='123456'; 
