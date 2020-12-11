#-*- coding: utf-8 -*-

# 特点：
# 字典是任意对象的无序集合
# 通过键而不是索引读取
# 字典是可变的，可以任意嵌套
# 字典中的键必须唯一
# 字典中的键必须不可改变,元组可以， 列表不行

# 创建
dictionary = {'qq':'1843357931', 'tel':'18810893603', 'wechart':'mzl'}
print(dictionary)
# 
dictionary2 = {}
dictionary2 = dict()

# 
name = ['张三', '李四', '王五', '狗剩']
sign = ['暖瓶座', '沙发座',  '射手座', '狮子座']
dictionary3 = dict(zip(name, sign))
print(dictionary3)


# 删除
del dictionary
# 变为空字典
dictionary2.clear()






