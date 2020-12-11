# vim都有哪几种模式，进入编辑模式的话有哪几种命令


# linux文件有哪几种权限，怎么授权？追问了chmod的参数


# linux查看一个文件多少行，如何创建文件（说命令）

head指令
作用：查看一个文件的前n行，如果不指定n，则默认显示前10行。
语法：#head -n 文件路径   【n表示数字】
tail指令
作用：查看一个文件的未n行，如果n不指定默认显示后10行
语法：#tail -n 文件的路径    n同样表示数字
wc指令
作用：统计文件内容信息（包含行数、单词数、字节数）
语法：#wc -lwc 需要统计的文件路径
	-l：表示lines，行数
	-w：表示words，单词数   依照空格来判断单词数量
	-c：表示bytes，字节数

#pwd             （print working directory，打印当前工作目录）
#mkdir 文件路径   （make directory，创建目录）
#touch 文件路径    创建文件



# linux操作命令：打包、看当前进程
打包：
tar -cf  压缩包名　　要压缩的文件

zip命令
　　解压：unzip FileName.zip
　　压缩：zip FileName.zip DirName

指令：ps
作用：主要是查看服务器的进程信息

top指令
作用：查看服务器的进程占的资源（100%使用）


# Linux 修改权限命令、有哪些权限


# 删除当前文件夹下2018年-2019年文件命令   

作用：用于查找文件（其参数有55个之多）
语法：#find 路径范围 选项 选项的值

选项：
	-name：按照文档名称进行搜索（支持模糊搜索）
	-type：按照文档的类型进行搜索
		文档类型：“-”表示文件（在使用find的时候需要用f来替换），“d”表示文件夹

案例：搜索etc目录下所有的conf后缀文件
#find /etc -name *.conf

案例：使用find来搜索/etc/sane.d/目录下所有的文件
#find /etc/sane.d/ -type f

案例：使用find来搜索/etc/目录下所有的文件夹
#find /etc -type d

要求： 归删除/var/svn/svnbackup目录下创建时间为7天之前，并且文件以new开头的的所有文件或文件夹； 
 
示例： find /var/svn/svnbackup -name "new_*" -mtime -7 -exec rm -rf {} \;
 
附注：
      -mtime -7 表示七天之前;
 
      -mtime +7 表示七天之内;
 
      -mtime 0  表示1天之内;


# linux进程调度算法 


# linux一个shell文件，启动之后pid多少？[题目有点迷]   










