# coding:utf-8

def order_cards(x):
    
    dictory = dict((y[0], []) for y in x)
    print(dictory)
    for i in x:
        if i[0] in dictory:
            dictory[i[0]].append(int(i[1]))
            
    order = ['k', 's', 'h', 'p', 'q']
    after_order = []
    for i in order:
        temp = sorted(dictory[i])
        for j in temp:
            after_order.append(i + str(j))
            
    return after_order


x2 = ["s1","s3","s9","s4","h1","p3","p2","q5","q4","q9","k2","k1"]
out = order_cards(x2)
print(out)