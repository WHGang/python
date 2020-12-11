
create database db0629 default charset utf8 collate utf8_bin;  -- utf8_bin（区分大小写 ）-- utf8_general_ci  不区分


use db0629;


CREATE TABLE `t_dept` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `deptName` VARCHAR(30) DEFAULT NULL,
 `address` VARCHAR(40) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 
CREATE TABLE `t_emp` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(20) DEFAULT NULL,
  `age` INT(3) DEFAULT NULL,
 `deptId` INT(11) DEFAULT NULL,
empno int  not null,
 PRIMARY KEY (`id`),
 KEY `idx_dept_id` (`deptId`)
 #CONSTRAINT `fk_dept_id` FOREIGN KEY (`deptId`) REFERENCES `t_dept` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 
 
 
INSERT INTO t_dept(deptName,address) VALUES('华山','华山');
INSERT INTO t_dept(deptName,address) VALUES('丐帮','洛阳');
INSERT INTO t_dept(deptName,address) VALUES('峨眉','峨眉山');
INSERT INTO t_dept(deptName,address) VALUES('武当','武当山');
INSERT INTO t_dept(deptName,address) VALUES('明教','光明顶');
 INSERT INTO t_dept(deptName,address) VALUES('少林','少林寺');
 
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('风清扬',90,1,100001);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('岳不群',50,1,100002);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('令狐冲',24,1,100003);
 
 INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('洪七公',70,2,100004);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('乔峰',35,2,100005);
 
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('灭绝师太',70,3,100006);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('周芷若',20,3,100007);
 
 
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('张三丰',100,4,100008);
 
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('张无忌',25,5,100009);
 
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('韦小宝',18,null,100010);



select * from t_emp;

select * from t_dept;


select * from t_emp
inner join t_dept
on t_emp.deptId = t_dept.Id;


select * from t_emp
left join t_dept
on t_emp.deptId = t_dept.Id;



select * from t_emp
left join t_dept
on t_emp.deptId = t_dept.Id
where t_emp.deptId is null;




alter table t_dept add CEO int(11);

update t_dept set CEO = 2 where id = 1;
update t_dept set CEO = 4 where id = 2;
update t_dept set CEO = 6 where id = 3;
update t_dept set CEO = 8 where id = 4;
update t_dept set CEO = 9 where id = 5;

select * from t_dept;

select * from t_emp;

select avg(age) from t_emp
inner join t_dept
on t_dept.CEO = t_emp.Id;


select t_emp.name, ceoid.name from t_emp
inner join
(select name, CEO from t_emp
left join t_dept
on t_dept.CEO = t_emp.Id) ceoid

on t_emp.Id = ceoid.CEO;


# 所有人物对应的掌门名称
# 1   3
select t_emp.name, ab.name as ceoname 
from t_emp 
left join
	(select t_dept.id, t_emp.name 
	from t_emp 
	inner join t_dept 
	on t_dept.CEO = t_emp.id)ab
on t_emp.deptid = ab.id;

# 2    4
select ab.name, t_emp.name as ceoname from
(select t_emp.name, t_dept.ceo 
from t_emp
left join t_dept 
on t_emp.deptid = t_dept.id)ab
left join t_emp 
on ab.ceo = t_emp.id;

# 3   2
select a.name, cc.name 
from t_emp a
left join t_dept b
on a.deptid = b.id
left join t_emp cc
on b.ceo =  cc.id;

# 4    1
select t_emp.name, (select cc.name from t_emp cc where cc.id = t_dept.ceo ) ceoname
from t_emp
left join t_dept 
on t_emp.deptid = t_dept.id






# -------------------------------------------------------------------------------------------

﻿CALL proc_drop_index('mydb','emp');
CALL proc_drop_index('mydb','dept');--

#1、列出自己的掌门比自己年龄小的人员

SELECT a.`name`,a.`age`,c.`name` ceoname,c.`age` ceoage FROM 
t_emp a 
LEFT JOIN t_dept b ON a.`deptId`= b.`id` 
LEFT JOIN t_emp c ON b.`CEO`= c.`id`
WHERE c.`age`<a.`age`


    
#优化  
EXPLAIN SELECT SQL_NO_CACHE a.`name`,a.`age`,c.`name` ceoname,c.`age` ceoage FROM 
emp a 
LEFT JOIN dept b ON a.`deptId`= b.`id` 
LEFT JOIN emp c ON b.`CEO`= c.`id`
WHERE c.`age`<a.`age`

CREATE INDEX idx_age ON emp(age)
    

#2、列出所有年龄低于自己门派平均年龄的人员

SELECT c.`name`,c.`age`,aa.age FROM t_emp c INNER JOIN
(
    SELECT a.`deptId`,AVG(a.`age`)age FROM t_emp a
    WHERE a.`deptId` IS NOT NULL
    GROUP BY a.`deptId`
 )aa ON c.`deptId`=aa.deptid 
 WHERE c.`age`< aa.age

#优化 

EXPLAIN SELECT SQL_NO_CACHE c.`name`,c.`age`,aa.age FROM emp c INNER JOIN
(
    SELECT a.`deptId`,AVG(a.`age`)age FROM emp a
    WHERE a.`deptId` IS NOT NULL
    GROUP BY a.`deptId`
 )aa ON c.`deptId`=aa.deptid 
 WHERE c.`age`< aa.age
 
 CREATE INDEX idx_deptid ON emp(deptid)
 
  CREATE INDEX idx_deptid_age ON emp(deptid,age)




#3、列出至少有2个年龄大于40岁的成员的门派

 SELECT b.`deptName`,COUNT(*) FROM t_emp a 
 INNER JOIN t_dept b ON b.`id` = a.`deptId`
 WHERE a.age >40
 GROUP BY b.`deptName`,b.`id` 
 HAVING COUNT(*)>=2
 
 #优化 
 EXPLAIN SELECT SQL_NO_CACHE b.`deptName`,COUNT(*) FROM  
dept b STRAIGHT_JOIN emp a  ON b.`id` = a.`deptId`
 WHERE a.age >40
 GROUP BY b.`deptName`,b.`id` 
 HAVING COUNT(*)>=2
 
 CREATE INDEX  idx_deptid_age ON emp(deptid,age)
 CREATE INDEX  idx_deptname ON dept(deptname)

  
 STRAIGHT_JOIN 强制确定驱动表和被驱动表 1、概念非常明确 2、对数据量的比例非常明确

#4、至少有2位非掌门人成员的门派
SELECT * FROM t_emp a WHERE a.id NOT IN
{
 SELECT b.`ceo` FROM t_dept b WHERE b.`ceo`IS NOT NULL
}  

NOT IN -->LEFT JOIN xxx ON xx WHERE xx IS NULL


SELECT c.deptname,  c.id,COUNT(*) FROM t_emp a 
INNER JOIN t_dept c ON a.`deptId` =c.`id`
LEFT JOIN t_dept b ON a.`id`=b.`ceo`
WHERE b.`id` IS NULL
GROUP BY c.`id` ,c.deptname
HAVING COUNT(*)>=2

#优化 

EXPLAIN SELECT SQL_NO_CACHE c.deptname,  c.id,COUNT(*) 
FROM  dept c STRAIGHT_JOIN emp a 
  ON a.`deptId` =c.`id`
LEFT JOIN dept b ON a.`id`=b.`ceo`
WHERE b.`id` IS NULL
GROUP BY c.deptname,c.`id` 
HAVING COUNT(*)>=2

CREATE INDEX idx_ceo_deptnam ON dept(ceo,deptname)
CREATE INDEX idx_deptnam ON dept(deptname)
CREATE INDEX idx_deptid ON emp(deptid)

SELECT b.`id`,b.`deptName` ,COUNT(*) FROM t_emp a INNER JOIN  t_dept b ON a.`deptId`= b.`id`
GROUP BY b.`deptName`,b.`id`

SELECT b.`id`,b.`deptName`, COUNT(*) FROM emp a INNER JOIN  dept b ON a.`deptId`= b.`id`
GROUP BY b.`deptName`,b.`id`

UPDATE t_dept SET deptname='明教' WHERE id=5

#5、列出全部人员，并增加一列备注“是否为掌门”，如果是掌门人显示是，不是掌门人显示否
CASE WHEN
IF
 
SELECT  a.`name`, CASE WHEN b.`id` IS NULL THEN '否' ELSE '是' END '是否为掌门'
FROM  t_emp a 
LEFT JOIN t_dept b ON a.`id`=b.`ceo`  
 


#6、列出全部门派，并增加一列备注“老鸟or菜鸟”，若门派的平均值年龄>50显示“老鸟”，否则显示“菜鸟”

SELECT b.`deptName`,
IF (AVG(a.age)>50,'老鸟','菜鸟')'老鸟or菜鸟'
 FROM t_emp a
INNER JOIN t_dept b ON a.`deptId`= b.`id`
 GROUP BY b.`id` ,b.`deptName`

#7、显示每个门派年龄最大的人

SELECT NAME,age FROM t_emp a
INNER JOIN
(
SELECT deptid,MAX(age) maxage
FROM t_emp
WHERE deptid IS NOT NULL
GROUP BY deptid
) aa ON a.`age`= aa.maxage AND a.`deptId`=aa.deptid

#优化 
EXPLAIN SELECT SQL_NO_CACHE NAME,age FROM emp a
INNER JOIN
(
SELECT deptid,MAX(age) maxage
FROM emp
WHERE deptid IS NOT NULL
GROUP BY deptid
) aa ON a.`age`= aa.maxage AND a.`deptId`=aa.deptid


CREATE INDEX idx_deptid_age ON emp(deptid,age)


#错例
SELECT b.`deptName`,a.`name`,MAX(a.`age`)FROM t_dept b
   LEFT JOIN t_emp a ON b.`id`=a.`deptId`
   WHERE a.name IS NOT NULL
   GROUP BY b.`deptName`


UPDATE t_emp SET age=100 WHERE id =2



#8、显示每个门派年龄第二大的人
SET @rank=0;
SET @last_deptid=0;
SELECT a.deptid,a.name,a.age
 FROM(    
    SELECT t.*,
     IF(@last_deptid=deptid,@rank:=@rank+1,@rank:=1) AS rk,
     @last_deptid:=deptid AS last_deptid
    FROM t_emp t
    ORDER BY deptid,age DESC
    
 )a WHERE a.rk=2;

#分组排序
SET @rank=0;
SET @last_deptid=0;
SELECT * FROM
(
 SELECT t.*,
     IF(@last_deptid=deptid,@rank:=@rank+1,@rank:=1) AS rk,
     @last_deptid:=deptid AS last_deptid
    FROM t_emp t
    ORDER BY deptid,age DESC
) a WHERE a.rk <=1


#oracle rank() over()

UPDATE t_emp SET age=100 WHERE id =1

SET @rank=0;
SET @last_deptid=0;
SET @last_age=0;

 SELECT t.*,
     IF(@last_deptid=deptid,
     IF(@last_age = age,@rank,@rank:=@rank+1)
     ,@rank:=1) AS rk,
     @last_deptid:=deptid AS last_deptid,
     @last_age :=age AS last_age
    FROM t_emp t
    ORDER BY deptid,age DESC










