create database fuck;


use fuck;

create table man
(
na varchar(10) not null,
lid int auto_increment  comment '编号',
web varchar(10) comment '网址',
primary key (lid)
);

create table tb_student
(
stuid int not null comment '学号', 
stuname varchar(20) not null comment '姓名',
stusex bit default 1,
stubirth date,
primary key (stuid)    -- 主键列
-- foreign key (colid) references tb_college (colid)
);


insert into tb_student values (5, '', 1, '2000-01-01');
insert into tb_student values (7, 'aaaaaa', 1, '2000-01-01');
