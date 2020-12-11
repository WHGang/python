#-*- coding: utf-8 -*-

dictionary = {'qq':'1843357931', 'tel':'18810893603', 'wechart':'mzl'}
print(dictionary)


# 添加、修改
dictionary['qqq'] = '11111111'  # 没有则添加，有则修改
print(dictionary)

# 删除 
del dictionary['qqq']
print(dictionary)
