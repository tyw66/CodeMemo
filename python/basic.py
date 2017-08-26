# -*- coding: utf-8 -*-
#!usr/bin/env python
author = "tyw66"
"""
Created on Thu Apr 20 13:37:02 2017

@author: tyw66
@Email:tyw66_github@qq.com

"""

import this

# Python区分大小写，是动态语言，强类型，无行结束符，多行文本保存用""",如上面
# Python版本：2.7

print '========================= 输出 ============================'
print 'hello'
print "hello"
print "hello", author  # 用逗号连接
print("hello, python3")  # python3.X版本
print



print '========================= 变量与运算 ============================'
twoAuthor1=author+author  #字符串连接
print '"author+author" is',twoAuthor1,'type:',type(twoAuthor1)
twoAuthor2=author,author
print '"author,author" is',twoAuthor2,'type:',type(twoAuthor2)




# 查看类型type()
print type(10)  # <type 'int'>
print type(10.0)  # <type 'float'>
print type(True)  # <type 'bool'>
print type("hello")  # <type 'str'>
print type('hello')  # <type 'str'>
print type(int)  # <type 'type'>
print type(sorted)  # <type 'builtin_function_or_method'>
print type(None)  # <type 'NoneType'>

# 布尔运算
a = True
b = False
print type(a), type(b), a, b
print
a = True + 1  # True=1
b = False + 1  # False=0
print type(a), type(b), a, b
print
c = True
d = False
print c, ' or ', d, '=', c or d  # 或 or
print c, ' and ', d, '=', c and d  # 与 and
print 'not ', c, '=', not c  # 非 not
print d is not (False or c is True)  # 是 is
print c in [True, False]  # 被包含 in，配合列表使用

# 算术运算
e = 21 / 4  # 程序理解为e是int
print e  # e=5
e = 21.0 / 4.0  # e是float
print e  # e=5.25
e = 21.0 // 4.0  # 取整除
print e  # e=5.0
f = 21 % 4  # 求余%
print f

## 幂运算**
print 2**10

##  字符串重复*
print "tyw66"*6

# 类型转换
print int(3.14159)
print float(10)
print bin(100)
c = True
e = 5.0
h = str(c + e)
l = h + " hello"  # 字符串连接 +
print l

# 转义字符
print '这是' \
      '一句话' \
      '只占1行'
print 'let\'s go!'
print r'let\'s go!'  # 取消转义
print '\o0002'  # 八进制
print '\x1e'  # 十六进制


print '========================= 控制语句 ============================'
# 判断循环
for i in range(10, -1, -1):  # 不含-1
    if (i != 0):
        print i
    elif (i == 0):
        print "i没了"
    else:
        print "i真没了"  # 不会执行

test = 10
while (True):
    test = test - 1
    if (test % 2 == 0):
        continue  # 忽略偶数
    if (test < 0):
        break
    print test


print '========================= 包管理 ============================'
# set PYTHONPATH="c:\python27\lib"
## 方法1 导入整个
import package
package.print_func("tyw66")
## 方法2 导入包中的部分函数
from package import hello
hello()


print "========================= 文件操作 ============================"
# import os
# os.mkdir('temp')
# os.chdir('./temp')
#os.rename("demo.txt","new.txt")


import sys
print sys.platform



print "========================= 输入=================================="
ipt=input("请输入一个值：")##暂停程序的作用 ，必要时，避免控制台一闪而过
print type(ipt),ipt