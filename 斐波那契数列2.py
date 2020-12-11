# -*- coding: UTF-8 -*-
from __future__ import print_function
# python2

num = input("请输入最终个数：")

a = 0
b = 1
count = 2

if num == 1:
    print(a)
elif num == 2:
    print(a, b)
else:
    print (a,  b, end=' ')
    while count < num:
        f = a + b
        print(f, end=' ')
        a = b
        b = f
        count += 1
        
        
print('\n')