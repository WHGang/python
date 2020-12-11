#-*- coding: utf-8 -*-

dictionary = {'qq':'1843357931', 'tel':'18810893603', 'wechart':'mzl'}
print(dictionary)

# 通过键值
aa = dictionary['qq']
print(aa)
aa = (dictionary['qqq'] if '' in dictionary else '我的字典没有此键值')
print(aa)

# 遍历
for item in dictionary.items():
    print(item)
    
for key, value in dictionary.items():
    print(key, value)