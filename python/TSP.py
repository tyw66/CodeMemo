#coding:utf-8
# 求解TSP问题
import math,sys
import random

#路径构造函数

#>>遍历算法生成路径(递归)
def perm(l):
	if (len(l))<=1:
		return [l]
		
	r=[]
	for i in range(len(l)):
		s=l[:i]+l[i+l:]
		p=perm(s)
		for x in p:
			r.append(l[i:i+1]+x)
	return r
	
#>>随机算法生成路径
def rad_gen(l):
	allpath=[[]]
	for i in range(0,5):
		l_bak=l
		r=[]
		while len(l)>0:
			tmp=random.choice(l)
			l.remove(tmp)
			r.append(tmp)			
	allpath[:][i]=r
	return allpath
	


#路径成本计算函数(算法无关)
def cal_dist(path,dist):
	sum_dist=0
	for j in range(0,len(path)-1):
		di=dist[int(path[j]-1)][int(path[j+1]-1)]
		sum_dist=sum_dist+di
	di=dist[int(path[len(path)-1]-1)][int(path[0]-1)]
	sum_dist=sum_dist+di
	return sum_dist
	

#主函数
if __name__=="__main__":
	# 城市列表
	CITY=[1,2,3,4,5]

	# 距离列表
	DIST=((0,1,3,4,5),
		(1,0,1,2,3),
		(3,1,0,1,2),
		(4,2,1,0,1),
		(5,3,2,1,0))
	
	#打印	
	for i in range(0,5):
		print DIST[i][:]
	print("=============")
		
	
	#定义路径	
	# PATH=[1,2,3,4,5]
	# print(PATH)
	
	# d=cal_dist(PATH,DIST)
	# print(d)
	
	##遍历得到所有路径
	# allpath=perm(CITY)
	
	##随机得到路径
	allpath=rad_gen(CITY)
	print(allpath)
	
	#比较所有路径，找出最短
	optmal=1000000
	index=-1
	for i in range(0,len(allpath)):
		pd=cal_dist(allpath[i],dist)
		if pd<optmal:
			optmal=pd
			index=i
		print (pd)
	
	

	print("The optmal lenth is:%d",pd)
	print("The optmal is:")
	print (allpath[index])
	print("完成")
	
	
	
	
	