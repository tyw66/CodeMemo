#!/usr/bin/python
# -*- coding: UTF-8 -*-
 
class Employee:
   '所有员工的基类'       #类文档字符串
   empCount = 0         #一个类变量，它的值将在这个类的所有实例之间共享。你可以在内部类或外部类使用 Employee.empCount 访问。

   #类的构造函数或初始化方法
   def __init__(aaa, name, salary):
      aaa.name = name
      aaa.salary = salary
      Employee.empCount += 1
   
   def displayCount(aaa):
     print "Total Employee %d" % Employee.empCount
 
   def displayEmployee(aaa):
      print aaa.__class__ 
      print "Name : ", aaa.name,  ", Salary: ", aaa.salary
      
def main():
    #使用类的名称 Employee 来实例化,通过 __init__ 方法接受参数
    "创建 Employee 类的第一个对象"
    emp1 = Employee("Zara", 2000)
    "创建 Employee 类的第二个对象"
    emp2 = Employee("Manni", 5000)
    emp1.displayEmployee()
    emp2.displayEmployee()
    print "Total Employee %d" % Employee.empCount
    
    print "Employee.__doc__:", Employee.__doc__
    print "Employee.__name__:", Employee.__name__
    print "Employee.__module__:", Employee.__module__
    print "Employee.__bases__:", Employee.__bases__
    print "Employee.__dict__:", Employee.__dict__
        


if __name__=="__main__"  :
    main()
    