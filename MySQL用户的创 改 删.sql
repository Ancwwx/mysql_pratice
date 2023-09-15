#创建
CREATE USER 'zhangsan'@'%' identified by 'abc123';

SELECT host,user FROM USER;

#登陆
mysql -uzhangsan -pabc123;

#退出
quit;

#修改
UPDATE USER set user ='lisi' WHERE USER='zhangsan' AND host='localhost';
flush privileges;

# 删除
DROP USER 'lisi'@'localhost';

#用户密码修改
#当前用户
ALTER USER USER() identified BY 'abcabc';

SET PASSWORD='abcabc'; 

#非当前用户
ALTER USER 'zhangsan'@'%' identified BY 'hello';

SET PASSWORD FOR  'zhangsan'@'%'='hello';

#用户赋予权限
GRANT SELECT,UPDATE ON dbtest1.* TO 'zhangsan'@'%';

SHOW GRANTS;

#回收权限
REVOKE SELECT ON dbtest1.* FROM 'zhangsan'@'%';

REVOKE ALL PRIVILEGES ON *.* FROM 'lisi'@'localhost';



