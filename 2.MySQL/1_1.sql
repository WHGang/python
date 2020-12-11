
-- 创建数据库
-- create database school default charset utf8; -- utf8mb4

-- 删除数据库
-- drop database if exits school;

-- 显示表格
-- show tables;



-- 切换到数据库
use school;

-- 删除表格
drop table if exists tb_student	;

-- 创建表格
create table tb_student
(
stuid int not null comment '学号', 
stuname varchar(20) not null comment '姓名',
stusex bit default 1,
stubirth date,
primary key (stuid)    -- 主键列
-- foreign key (colid) references tb_college (colid)
);

-- 修改表格
-- 添加列
alter table tb_student add column studdr varchar(255); 
-- 修改列
alter table tb_student change column studdr studdr varchar(511);  
-- 删除列
-- alter table tb_student drop column studdr;  

-- 插入数据
insert into tb_student values (1001, '张三丰', 1, '2000-01-01', '山东');
-- 主键列不能相同
insert into tb_student values (1002, '张三丰', 1, '2000-01-01', '山东');
-- 插入指定列
insert into tb_student (stuid, stuname, stusex, stubirth, studdr) values 
(1003, '张翠山', 1, '2000-01-01', '山东'),
(1004, '殷素素', 0, '2000-01-01', '山东'),
(1005, '张院桥', 1, '2000-01-01', '山东');

-- 删除数据
-- delete from tb_student;  删除全部
delete from tb_student where stuid = 1002;

-- 更新数据
update tb_student set studdr='河南' where stuid in (1004,1005);

-- 插入指定列
insert into tb_student (stuid, stuname, stusex, stubirth, studdr) values 
(1006, '谢逊', 1, '2000-01-01', '光明顶'),
(1007, '周芷若', 0, '2000-01-01', '峨眉'),
(1008, '张无忌', 1, '2000-01-01', '山东');





















