# coding:utf-8



num = 100
nums = [11, 22]


# １．全局变量(却不可以直接在函数里使用)
def test0():
    # 说好的全局变量呢?????????????
    num += 100  # UnboundLocalError: local variable 'num' referenced before assignment


# 在函数体内部使用全局变量
## 全局变量可以直接在函数体内容部使用的，你可以直接访问，但是注意的是，
## 对于不可变类型，在函数里面进行了赋值操作，则对外面的全局变量不产生影响，相当于新建了一个局部变量，只是名字和全局一样，
## 对于可变类型，如果使用赋值语句会对外部产生影响。
print('~'*20)
def test1():
    num = 300
    nums.append(33)
    nums[-1] = 10
test1()    
print(num)
print(nums)

# global关键字
## 上面说到，对于不可变类型如果使用的是赋值语句，在函数内部相当于新建了一个变量，并且重新给了指向，
## 但是有时候我们想把这个变量就是外部的那个全局变量，在赋值操作的时候，就是对全局变量给了重新的指向，
## 这个时候可以通过global关键字表示我在函数里面的这个变量是使用的全局那个。
print('~'*20)
def test2():
    global num
    num = 300

test2()    
print(num)
