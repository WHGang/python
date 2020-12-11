
-- 删除数据库
drop database if exists school;

-- 创建数据库
create database school default charset utf8 collate utf8_bin;  -- utf8_bin（区分大小写 ）-- utf8_general_ci  不区分


-- 切换到数据库
use school;

-- 创建学院表
create table tb_college
(
collid int auto_increment  comment '编号',
collname  varchar (50) not null comment '名称',
collmaster  varchar (20) not null comment '院长',
collweb varchar(512) comment '网址',
primary key (collid)
);

-- 创建学生表
create table tb_student
(
stuid int not null comment '学号', 
stuname varchar(20) not null comment '姓名',
stusex bit default 1 comment '性别',
stubirth date not null comment '出生日期',
stuaddr varchar(255) default ''  comment '籍贯',
collid int not null comment '所属学院',
primary key (stuid),                            -- 主键列
foreign key (collid) references tb_college (collid)
);

-- 创建教师表
create table tb_teacher
(
teaid int not null comment '工号',
teaname varchar(20) not null comment '姓名',
teatitle varchar(10) default '助教' comment '职称',
collid int not null comment '所属学院',
primary key (teaid),
foreign key (collid) references tb_college (collid)
);

-- 创建课程表
create table tb_course
(
couid int not null comment '编号', 
couname varchar(50) not null comment '名称',
coucredit int not null comment '学分',
teaid int not null comment '授课老师',
primary key (couid),    -- 主键列
foreign key (teaid) references tb_teacher (teaid)
);

-- 创建选课记录表
create table tb_score
(
scid   int auto_increment  comment '选课记录编号', 
stuid  int not null comment '选课学生',
couid  int not null comment '所选课程',
scdate datetime     comment '选课时间日期',
scmark decimal(4,1) comment'考试成绩',
primary key (scid),     -- 主键列
foreign key (stuid) references tb_student (stuid),
foreign key (couid) references tb_course (couid)
);

-- 添加唯一性约束（一个学生选某个课程只能选一次）
alter table tb_score add constraint uni_score_stuid_couid unique (stuid, couid);

-- ----------------------------------------------------------------------------------------------------------
-- 修改表格
-- ----------------------------------------------------------------------------------------------------------
-- 修改表格
-- 添加列
alter table tb_student add column fuck varchar(10); 
-- 修改列
alter table tb_student change column stuname stuname varchar(25) not null;  
-- 删除列
alter table tb_student drop column fuck;  



-- ----------------------------------------------------------------------------------------------------------
-- 插入数据
-- ----------------------------------------------------------------------------------------------------------
-- 插入学院数据
insert into tb_college 
(collname, collmaster, collweb) values 
("计算机学院", '左冷禅', 'http'),
("外国语学院", '岳不群', 'http2'),
("经济管理学院", '风清扬', 'http3');

-- 插入学生数据
insert into tb_student
(stuid, stuname, stusex, stubirth, stuaddr, collid) values
(1001, '向问天', 1,  '1990-3-4', '四川', 1),
(1002, '任我行', 1,  '1992-3-4', '河南', 1),
(1033, '任盈盈', 0,  '1993-3-4', '河南', 1),
(1572, '余沧海', 1,  '1984-3-4', '湖南', 1),
(1378, '岳灵珊', 0,  '1995-3-4', '四川', 1),
(1954, '林平之', 1,  '1986-3-4', '山西', 1),
(2035, '令狐冲', 1,  '1997-3-4', null, 2),
(3011, '林振南', 1,  '1998-3-4', '陕西', 3),
(3755, '龙傲天', 1,  '1989-3-4', '广东', 3),
(3923, '向天问', 0,  '1990-3-4', '四川', 3);

-- 插入教师数据
insert into tb_teacher
(teaid, teaname, teatitle, collid) values
(1122, '张三丰', '教授', 1),
(1133, '松园桥', '副教授', 1),
(1144, '杨晓', '副教授', 1),
(2255, '反咬', '副教授', 2),
(3366, '韦一笑', '讲师', 3);

-- 插入课程数据
insert into tb_course 
(couid, couname, coucredit, teaid) values
(1111, 'python', 3, 1122),
(2222, 'web', 2, 1122),
(3333, '操作', 4, 1122),
(4444, '计算机', 2, 1133),
(5555, '编译', 4, 1144),
(6666, '算法', 3, 1144),
(7777, '经贸', 3, 2255),
(8888, '成本', 2, 3366),
(9999, '审计', 3, 3366);

-- 插入选课数据
insert into tb_score 
(stuid, couid, scdate, scmark) values
(1001, 1111, now(), 95),
(1001, 2222, now(), 87.5),
(1572, 3333, now(), 100),
(1001, 4444, now(), null),
(1378, 6666, now(), 100),
(1002, 1111, now(), 65),
(1002, 5555, now(), 42),
(1033, 1111, now(), 92.5),
(1033, 4444, now(), 93.5),
(1033, 5555, now(), 95),
(3755, 1111, now(), 95),
(1954, 1111, now(), 94),
(2035, 7777, now(), 91),
(1001, 7777, now(), 92),
(1001, 9999, now(), 98),
(3011, 1111, now(), 99),
(3755, 9999, now(), 91.5),
(3923, 1111, now(), 92.5);

-- -----------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------
-- 查询

-- 查询所有学生信息
select * from tb_student;

-- 查询所有课程名称及学分（投影和别名）
select couname, coucredit from tb_course;

select couname as 课程名称, coucredit 学分 from tb_course;

-- case 的用法 case when <pred> then <result> ... else <result>  end  是一个组合。
select stuname , case stusex when 1 then '男' else '女' end   as 性别 from tb_student;  -- ----------------

-- 查询所有女同学的姓名和出生日期（筛选）
select stuname, stubirth from tb_student  where  stusex = 0;


-- 查询所有80后学生的姓名、性别和出生日期（筛选）
select stuname, stusex, stubirth   from  tb_student where stubirth between '1990-1-1'  and '1999-12-31';
select stuname, stusex, stubirth   from  tb_student where stubirth >= '1990-1-1' and stubirth <= '1999-12-31';

-- 查询性“杨” 的学生姓名和性别（模糊）；
select stuname, stusex from tb_student where stuname like'林%';

-- 查询性“杨” 的名字三个字的学生姓名和性别（模糊）
select stuname, stusex from tb_student where stuname like'林__';

-- 查询名字中有 不 或者 焉 的学生的姓名（模糊）
select stuname from tb_student where stuname like '%平%' or stuname like '%我%';


-- 查询没有录入家庭住址的学生姓名（空值）
select stuname from tb_student where stuaddr  = ' ';
select stuname from tb_student where stuaddr  is null;


-- 查询录入家庭住址的学生姓名（空值）
select stuname from tb_student where stuaddr  = ' ';
select stuname from tb_student where stuaddr  is  not null;

-- 查询学生选课的所有日期（去重）
select distinct scdate from tb_score;

-- 查询男同学的姓名和生日按照年龄从大到小排序（排序）
select stuname, stubirth from tb_student where stusex = 1 order by stubirth asc;  -- desc 降序

select stuname, year(now()) - year(stubirth) as 年龄 from tb_student where stusex = 1 order by 年龄 desc;  -- desc 降序

-- 查询年龄最大的学生的出生日期（聚合函数）
select min(stubirth) from tb_student;


-- 聚合函数： max/min/count/sum/avg
-- 查询年龄最小的学生的出生日期（聚合函数）
select max(stubirth) from tb_student;

-- 查询男女学生的人数（分组和聚合函数）
select count(stuid) from tb_student;
select count(*) from tb_student;

select stusex, count(stuid) from tb_student group by stusex;

select stusex, min(stubirth) from tb_student group by stusex;


-- 查询课程编号为 1111 的课程的平均成绩（筛选和聚合函数）
select avg(scmark)from tb_score where couid=1111;

-- 查询学号为 1001 的所有课程的平均成绩（筛选和聚合函数）
select avg(scmark)from tb_score where stuid=1111;

-- 查询每个学生的学号和平均成绩（分组和聚合）
select stuid , avg(scmark) from tb_score group by stuid;

-- 查询平均成绩大雨等于90的学生的学号和平均成绩
-- 分组以前的筛选使用where
-- 分组以后的筛选使用having
select stuid , avg(scmark) as  平均分 from tb_score group by stuid having 平均分>=90;


-- 查询年龄最大的学生的姓名（子查询）
select stuname as 姓名, year(now())-year(stubirth) as 年龄 from tb_student where stubirth=(
select nmin(stubirth) from tb_student
);

-- 查询选了两门以上的课程的学生姓名（子查询、分组条件、集合运算）
select stuname from tb_student where stuid in (
select stuid from tb_score group by stuid having count(stuid)>2
);

-- 查询学生姓名，课程名称以及成绩（链接查询）



















