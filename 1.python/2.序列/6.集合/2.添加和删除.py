#-*- coding: utf-8 -*-

set1 = {'python', 123, 'set', (123, 456)}
print(set1)

# 添加
set1.add('asdf')
print(set1)


# 删除
set1.remove('asdf')          # 删除指定元素
print(set1)

set1.pop()                   # 删除一个元素
print(set1)


set1.clear()                 # 清空
print(set1)
