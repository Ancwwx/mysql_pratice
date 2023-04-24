UPDATE employee SET salary =5000;
SELECT * FROM employee;
UPDATE employee SET salary =3000
                WHERE user_name='小妖怪';
INSERT INTO employee VALUES (200,'老妖怪','1999-12-12','2012-11-29 12:12:22','加餐',5000,'给大王送食物','');
UPDATE employee SET salary =salary+1000
                WHERE user_name='老妖怪';
UPDATE employee SET salary =salary+1000,job='出主意的'
 WHERE user_name='老妖怪';