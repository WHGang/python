#-*- coding: utf-8 -*-


list1 = [1, 2, 3, 4, 2]
list2 = ['q', 'w', 'e']

# 使用列表内函数
#num = list1.sort()          # 错误，排序时把本体值改了
list1.sort()                 # 正确，升序
print(list1)
list1.sort(reverse = True)    # 正确，降序
print(list1)


# 反向列表中元素
list1.reverse()
print(list1)#


# 使用python内置函数
list11 = sorted(list1)       # 重新赋值
#print(list11)
