DESC myemp1;

#添加一个字段
ALTER TABLE myemp1 
ADD salary DOUBLE(10,2);#默认添加到表中的最后一个字段位置

#指定位置
ALTER TABLE myemp1 
ADD phone_number VARCHAR(20) FIRST;
ALTER TABLE myemp1 
ADD email VARCHAR(45) AFTER emp_name;

#修改一个字段：数据类型，长度，默认值
ALTER TABLE myemp1 
MODIFY emp_name VARCHAR(25);

ALTER TABLE myemp1 
MODIFY emp_name VARCHAR(35) DEFAULT 'aaa';

#重命名一个字段
ALTER TABLE myemp1 
CHANGE salary monthly_salary DOUBLE(10,2);

ALTER TABLE myemp1 
CHANGE email myemail VARCHAR(50);

#删除一个字段
ALTER TABLE myemp1
DROP COLUMN myemail;


