# -*- coding: UTF-8 -*-


alist = [8, 9, 12, 15, 59, 89, 89]
n = len(alist)

def binory_search(x, alist):
    n = len(alist)
    mid = len(alist) / 2

    if alist[mid] > x:
        # left
        # 判断上是否超出索引
        if mid > 0:
            return binory_search(x, alist[:mid])
        else:
            return False

    elif alist[mid] ==  x:
        return True

    elif alist[mid] < x:
        # right
        # 判断上是否超出索引
        if mid < n - 1:
            return binory_search(x, alist[mid+1:])
        else:
            return False

def binory_search2(x, alist):
    n = len(alist)
    mid = len(alist) / 2

    if n > 0:
        if alist[mid] > x:
            # left
            return binory_search(x, alist[:mid])

        elif alist[mid] ==  x:
            return True

        elif alist[mid] < x:
            # right
            return binory_search(x, alist[mid+1:])
    
    return False




x = 14
aa = binory_search(x, alist)
print(aa)