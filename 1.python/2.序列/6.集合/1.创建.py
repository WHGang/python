#-*- coding: utf-8 -*-
#/usr/bin/python
# 集合：用于保存不重复元素
# 特点：
# 1.创建时，元素相同时，只保留一个；
# 2.集合是无序的，每次输出的顺都有可能不同；
# 3.
# 

## 1.创建
# 直接创建
set1 = {'python', 123, 'set', (123, 456)}
print(set1)
# set([(123, 456), 123, 'set', 'python'])


# set()
set2 = set(['q', 'w', 'e', 't', 'q', 'i, h'])   # 乱序，不重复
print(set2)
# set(['q', 'e', 't', 'w'])

set3 = set('i ,h ,g')                           # 逗号也包括
print(set3)
# set(['i', ' ', ',', 'g', 'h'])