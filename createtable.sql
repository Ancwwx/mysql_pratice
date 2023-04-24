CREATE TABLE `emp`(
         id INT,
         `name` VARCHAR(32),
         sex CHAR(1),
         birthday DATE,
         entry_date DATETIME,
         job VARCHAR(32),
         salary DOUBLE,
         `resume` TEXT)CHARSET utf8 COLLATE utf8_bin ENGINE INNODB;
INSERT INTO `emp`VALUES(100,'小妖怪','男','2000-11-11','2010-11-10 11:11:11','巡山',3000,'大王叫我来巡山');   
SELECT * FROM `emp` ;    
        
         
         