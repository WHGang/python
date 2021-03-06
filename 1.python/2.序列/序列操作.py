#-*- coding: utf-8 -*-


## 浅拷贝和深拷贝
# 可变类型set,list,dict进行浅拷贝后，拷贝后的也会受影响。

dictionary = {'qq':'1843357931', 'tel':'18810893603', 'wechart':'mzl'}
dictionary2 = dictionary
dictionary['qq'] = '11111111111'
print(dictionary2)







import copy
a = [1, 2, 3, 4, ['a', 'b']] 
b = a                # 引用，除非直接给a重新赋值，否则a变则b变，b变则a变
c = copy.copy(a)     # 浅复制，只会拷贝父对象， 不会拷贝父对象中的子对象，所以若a的子对象变则c 变,但是父对象变c不会变
d = copy.deepcopy(a) #深拷贝，完全拷贝，完全独立于原对象，a变 也 不变
a.append(5)          # 改变父对象
a[4].append('c')     #改变父对象中的 ['a', 'b']子对象

# a=[1, 2, 3, 4, ['a', 'b','c'],5] 
# b=[1, 2, 3, 4, ['a', 'b','c'],5] 
# c=[1, 2, 3, 4, ['a', 'b','c']] 
# d=[1, 2, 3, 4, ['a', 'b']] 

# 考察：赋值、深拷贝、浅拷贝
# 1.对象的赋值 
# 都是进行对象引用（内存地址）传递，即‘’ b is a‘’ ，a 变 b 也变
# 2.浅拷贝
# 会创建一个新的对象,即 “c is not a” ，但是，对于对象中的元素，浅拷贝就只会使用原始元素的引用（内存地址），也就是说”c[i] is a[i]”
# 当我们使用下面的操作的时候，会产生浅拷贝的效果：

# 使用切片[:]操作
# 使用工厂函数（如list/dir/set）
# 使用copy模块中的copy()函数
# 3.深拷贝 
# 会创建一个新的对象，即”d is not a” ，并且 对于对象中的元素，深拷贝都会重新生成一份（有特殊情况，下面会说明），而不是简单的使用原始元素的引用（内存地址）
# 拷贝的特殊情况

# 其实，对于拷贝有一些特殊情况：

# 对于非容器类型（如数字、字符串、和其他’原子’类型的对象）没有拷贝这一说
# 如果元祖变量只包含原子类型对象，则不能深拷贝