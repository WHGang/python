# -*- coding: UTF-8 -*-
# 递归实现


n = int(input('请输入想要的个数:'))

def fun_a(n):
    for i in range(1,n+1):
        print(fun(i)),


def fun(n):
    
    if n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fun(n-1) + fun(n-2)


fun_a(n)
