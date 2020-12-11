#-*- coding: utf-8 -*-
import time

def display_time(func):
    def wrapper(n):
        t1 = time.time()
        result = func(n)
        t2 = time.time()
        print(t2-t1)
        return result
    return wrapper
def is_Prime(num):
    if num < 2:
        return True
    elif num ==  2:  
        return False
    else:
        for i in (2,num):
            if num % i == 0:
                return False
            return True
@display_time
def find_Prime(n):
    count = 0 
    for i in range(2,n):
        if is_Prime(i):
            count += 1
    return count

out = find_Prime(10)
print(out)
