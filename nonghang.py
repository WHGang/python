# coding:utf-8

# 1.十进制转三进制数，012分别换成@$&

def fun(x):
    
    a = []
    ss = ''
    while True:
        n = x//3  # 
        m = x%3
        a.append(m)
        if n == 0:
            break
        x = n

    a.reverse()
    for i in a:
        if i == 0:
            ss += '%'
        elif i == 1:
            ss += '$'
        else:
            ss += '#'

        
    return ss
        
aa = fun(12)
print(aa)


# https://blog.csdn.net/weixin_44289604/article/details/108292193
def to_ternary(x):
    s = ''
    temp1 = 1
    while temp1 != 0:
        temp1 = x // 3
        temp2 = x % 3
        x = temp1
        s = s + str(temp2)
    s = s.replace('2', '&')
    s = s.replace('1', '$')
    s = s.replace('0', '@')
    # 链式
    # s = s.replace('2', '&').replace('1', '$').replace('0', '@')
    # 或者可以写一个循环
    # rep = ['@','$','&']
    # for i in range(3):
        # s = s.replace(str(i), rep[i])
    s1 = list(reversed(s))
    return "".join(s1)

x = 0
print(to_ternary(x))



# 2.寻找距离质心最近的点在输入列表中的索引
# https://blog.csdn.net/weixin_44289604/article/details/108292297

def find_clear_point(test):
    
    x = []
    y = []
    for i in range(len(test)):
        x.append(float(test[i].split(',')[0]))
        y.append(float(test[i].split(',')[1]))

    # x = [int(i[0]) for i in text]
    # y = [int(i[2]) for i in text]

    print(x[2])
    cen_x = sum(x) / len(x)
    cen_y = sum(y) / len(y)
    
    d = []
    
    for i in range(len(x)):
        dd = (x[i] - cen_x)**2 + (y[i] - cen_y)**2 
        d.append(dd)
        
    return d.index(min(d))


text2 = ["1,1","2,2","1,2","1,3"]
print(find_clear_point(text2))


# 3.扑克牌排序
# https://blog.csdn.net/weixin_44289604/article/details/108292344

def order_cards(x):
    color = dict((i[0], []) for i in x)
    print(color)
    for j in x:
        if j[0] in color.keys():
            color[j[0]].append(int(j[1]))

    order = ['k', 's', 'h', 'p', 'q']
    after_order = []
    for i in order:
        temp = sorted(color[i])
        for j in temp:
            after_order.append(i + str(j))
    return after_order

x2 = ["s1","s3","s9","s4","h1","p3","p2","q5","q4","q9","k2","k1"]
out = order_cards(x2)
print(out)



# 
name = ['张三', '李四', '王五', '狗剩']
sign = ['暖瓶座', '沙发座',  '射手座', '狮子座']
dictionary3 = dict(zip(name, sign))
print(dictionary3)