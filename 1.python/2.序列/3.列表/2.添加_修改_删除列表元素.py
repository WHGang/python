#-*- coding: utf-8 -*-


list1 = [1, 2, 3, 4]
list2 = ['q', 'w', 'e']

## 添加
# 末端添加
list1.append(666)
print(list1)

# 指定位置
list1.insert(0, 'q')
print(list1)


# 两个列表合并
list3 = list1+list2
print(list3)

list1.extend(list2)
print(list1)


# 修改元素
list1[0] = 0
#print(list1)


## 删除元素
# 索引
del list1[-1]
#print(list1)

# 元素值
list1.remove('q')
print(list1)

# 移除列表中的一个元素（默认最后一个元素），并且返回该元素的值
list1.pop(-2)
print(list1)


