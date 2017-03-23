#!/bin/bash
##第一行：说明脚本需要的解释器：bash
clear
#echo输出命令 
echo "=================> 变量 varible <==================="
#变量赋值
AUTHOR="tyw" 
#这样只会输出AUTHOR
echo AUTHOR
#要使用变量 变量前需加$ 变量外推荐加上花括号{}
echo "hello" ${AUTHOR}
#要执行命令，可以直接写，也可以套上$（）
echo "the cuurent dir is:" $(pwd)
#重新赋值 也不加$
AUTHOR="tangyw"
echo ${AUTHOR}
#设为只读变量
readonly AUTHOR_ID="tyw66"
#因此下面这行就会报错
#AUTHOR="shit"
#删除变量
unset PERSON
#不会报错，输出空值
echo ${PERSON}
#不能删除只读变量,因此下面这行就会报错
#unset PERSON_ID

echo "==============> 特殊变量 special varible <================"
#符号$表示当前进程ID
echo "当前进程ID为："$$
#上个命令的退出状态/返回值
echo "上个命令的退出状态/返回值："$?
#传递的参数个数
echo "传递的参数个数："$#
#当前脚本文件名
echo "当前脚本文件名:"$0
#传递进的参数1、参数2
echo "传递进来的参数："$1 $2
#传递的所有参数（各参数一起）
echo "传递的所有参数：" $*
echo "传递的所有参数：" "$*"
#传递的所有参数（各参数分开）
echo "传递的所有参数：" $@
echo "传递的所有参数：" "$@"

echo "==============> 循环 loop <================"
#for循环
for var in $* "$*" $@ "$@"
do 
	echo $var
done

#for循环
for skill in C# C++ PYTHON
do 
	echo "this ${skill} programming lauguage."
done



