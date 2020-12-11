# -*- coding: UTF-8 -*-


list1 = [14, 56, 69, 24, 3, 88, 33, 41]
bn = len(list1)

# 选择排序

for j in range(n-1):
    # 找 n-1 次, 0~n-2
    min_n = list1[j]

    for i in range(j, n):
        # 从 j 开始找 
        if min_n < list1[i]:
            list1[j], list1[j] = list1[i], list1[i]

print(list1)