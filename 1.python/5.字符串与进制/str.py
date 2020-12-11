# -*- coding: UTF-8 -*-
# 字符串操作

# 1. 字符串和列表

## 1. 字符串转列表
# 方法一
str1 = "hi hello world"
print(str1.split(" "))
# 输出：
# ['hi', 'hello', 'world']
 
# 方法二-- 只能单个元素
s_list= list(str1)
print(s_list)


## 2. 列表转字符串
# str.join(sequence)   返回通过指定字符(str)连接序列中元素(sequence)后生成的新字符串。
l = ["hi","hello","world"]
print(" ".join(l))
# 输出：
# hi hello world

