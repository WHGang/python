# -*- coding: UTF-8 -*-

list1 = [154, 52, 26, 2, 54, 76, 13]

leng = len(list1)

# 采用冒泡排序-从小到大

for j in range(0, leng-1):
    print(j)
    for i in range((leng-1)-j):
        pre = list1[i]
        cur = list1[i + 1]
        
        if pre > cur:
            list1[i], list1[i + 1] = cur, pre

print(list1)

print('------------------------------------------------------------------------------------------')
for j in range(leng-1, 0, -1):
    print(j)
    for i in range(j):
        pre = list1[i]
        cur = list1[i + 1]
        
        if pre > cur:
            list1[i], list1[i + 1] = cur, pre
        
print(list1)
