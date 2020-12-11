# python中闭包，闭包的实质
https://www.cnblogs.com/Lin-Yi/p/7305364.html


# 可变对象为引用传递，不可变对象为值传递。
foo = [1,2]
foo1 = foo
foo.append(3)

"r","w","a","rb","wb","ab"：指定对文件打开方式即文件内容操作方式，即只读，可写，追加，二进制读，二进制写，二进制追加