#-*- coding: utf-8 -*-

# 1.可以包含各种类型的元素；
listname = [1,2, 3, 'qq', '啥地方']


# 创建列表
# 两个列表合并
list1 = [1, 2, 3, 4]
list2 = ['q', 'w', 'e']
list3 = list1+list2     # 贼慢

listt3 = [i for i in range(10)]

list4 = list(range(10))

# 2.删除
del listname