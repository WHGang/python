# -*- coding: UTF-8 -*-

list1 = [154, 52, 26, 2, 54, 76, 13]
print("input: %s" % list1)
n = len(list1)



for j in range(1, n):
    
    for i in range(j, 0, -1):
        if  list1[i]  < list1[i-1]:
            list1[i-1], list1[i] = list1[i], list1[i-1]


print("output: %s" % list1)
        
        
