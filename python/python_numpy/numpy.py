#!usr/bin/python3
#-*-coding:utf-8 -*-

import numpy as np

##矩阵乘法
#x=np.array([[2,2,2,2,2,2]])
#print "x shape:", x.shape
#y=np.array([[1],[2],[3]])
#print "y shape:", y.shape
#m=np.dot(y,x)
##=======
#ori=np.linspace(1,10,10)
#hrz=np.reshape(ori,[2,5])
#vet=np.reshape(ori,[5,2])
#m1=np.dot(hrz[1,:],vet)#切片
#m2=np.dot(hrz,vet)
#m5=np.dot(vet,hrz)


##随机数
from numpy import random as nr
import matplotlib.pyplot as plt

number=20
data=nr.randint(0,100,[1,number])
#x=np.zeros([1,0],)
x=np.linspace(1,10,10)

plt.figure(figsize=(8,4))
plt.plot(x,data)  
plt.show()

x=[1,2,3,4,5,6,2,3,5,3,4]

