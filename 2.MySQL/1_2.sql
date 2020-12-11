

-- 使用数据库school
use school;

-- 创建表格
create table tb_college
(
colid int auto_increment  comment '编号',
colname  varchar (30) not null comment '名称',
wbsite varchar(1023) comment '网址',
primary key (colid)
);


-- 添加数据
insert into tb_college (colname) values 
("计算机学院"),
("外国语学院"),
("经济管理学院");

alter  table tb_student add column colid int;

-- delete from tb_student where colname=colid; 

-- 修改学生表添加外键约束 (也可以在表内添加)
alter table tb_student add constraint fk_student_colid 
foreign key (colid) references tb_college (colid);

update tb_student set colid=1 where stuid between 1001 and 1005;
update tb_student set colid=2 where stuid in (1006, 1007);
update tb_student set colid=3 where stuid=1008;























