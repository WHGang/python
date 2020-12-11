

-- 切换到数据库
use school;

-- 创建表格
create table tb_course
(
couid int not null comment '编号', 
couname varchar(50) not null comment '名称',
coucredit int not null comment '学分',
teaid int not null comment '授课老师',
primary key (souid),    -- 主键列
foreign key (colid) references tb_college (colid)
);

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



















