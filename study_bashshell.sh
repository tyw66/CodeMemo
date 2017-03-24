#!/bin/bash
##说明脚本需要的解释器：bash
###########################################################
##
##One hour shell tutorial
##Author:tyw66 2639144635@qq.com
##Create date：2017-03-23
##
##Reference:http://www.runoob.com/linux/linux-shell.html
##          http://man.linuxde.net/
##
###########################################################
clear

echo "===============> 简单输出 echo output <==============="
#echo输出命令 
echo "Hello,This file comes from tyw66 "
#激活转义字符 -e
echo -e "Hello,\nThis file comes from tyw66 "
#不换行 \c
echo -e "This \c"
echo "is a sentence."

echo "=================> 变量 varible <====================="
#变量赋值
AUTHOR="tyw" 
#这样只会输出AUTHOR
echo AUTHOR
#要使用变量 变量前需加$ 变量外推荐加上花括号{};
echo "hello" ${AUTHOR}
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
echo ">>变量替换"
#如果变量为空或被删除，返回null variable，不改变PERSON值
echo ${PERSON:-"null variable"} ${PERSON}
#如果变量为空或被删除，返回null variable，设置PERSON值为nullWord
echo ${PERSON:="null variable"} ${PERSON}
#如果变量被定义，返回defined variable，不改变PERSON值
PERSON="TYW"
echo ${PERSOM:+"defined variable"} ${PERSON}
#如果变量为空或被删除，将消息messageWord传到标准错误输出,shell脚本会停止运行
echo ${PERSON:?"uhh...message"} ${PERSON}
echo

echo "==========> 进程参数 Process parameters <============="
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
echo

echo "==================> 循环 loop <======================="
#for循环, 区别$* "$*" $@ "$@"
for var in $* "$*" $@ "$@"
do 
	echo $var
done

#for循环 基本
for skill in C# C++ PYTHON
do 
	echo "this ${skill} programming lauguage."
done
echo

#for循环 输出字符串内容
for str in "This is a 1 hour shell tutorial"
do
	echo ${str} 		#why doesn't the command output in a new line?
done

#for循环 遍历指定文件
for FILE in `ls`
do
	echo ${FILE}
done

#while循环，while后面要有空格
COUTER=0
while [ ${COUTER} -lt 5 ]
do 
	COUTER=`expr ${COUTER} + 1`
	echo ${COUTER}
done

#until循环，while后面要有空格
NUMBER=0
until [ ! $NUMBER -lt 10 ]
do 
	echo ${NUMBER}
	NUMBER=`expr ${NUMBER} + 1 `
done

#跳出循环 break；跳出第n层循环 break n;继续循环 continue
#todo
echo

echo "==================> 判断  <======================="
echo $1
#if语句
if [ !$1 ]		#等价于if [ $1 == "" ]
then
	echo "hello world!"
elif [ $1 == 'tyw66' ]
then
	echo "hello author!"
else
	echo "hello $1!"
fi

#if test连用
#todo

#case循环
#todo


echo

echo "=================> 命令 command <====================="
#要执行命令命令外面套上` `,就是ESC下面的那个键。也可以套上$（）
echo "the cuurent dir is:" `pwd`
echo "the cuurent dir is:" $(pwd)
#用` `号将执行结果保存在变量中 等价的
DATE=`date`
echo "Date is $DATE"
echo "Date is" `date`
echo "Date is" $(date)
USERS=`who|wc -l`
echo "Logged in user are $USERS"
#两条命令之间用分号
UP=`date;uptime`
echo "uptime is ${UP}"
echo 

echo "===============> 运算符 operator <===================="
echo ">>算术运算符"
#expr命令实现简单计算。注意表达式与运算符之间要有空格，被` `包含
val=`expr 2 + 1`
echo "2+2= ${val}"
#乘号左边需要加反斜杠\
a=2
b=20
echo "2*20+2+1= "`expr ${a} \* ${b} + ${val}`
#求余
echo "${b}除以${val}的余数是："`expr ${b} % ${val}`
##awk todo

echo ">>关系运算符"
#todo
echo ">>布尔运算符"
#todo
echo ">>字符串运算符"
#todo
echo ">>文件测试运算符"
#todo
echo

echo "===============> 字符串 string <======================"
#单引号与双引号的区别
string='单引号主要用于原样输出，\n有转义字符也不行,也不能引用变量${PERSON}，不能嵌套单引号'
echo ${string}
string="双引号内就可以，\n可以出现\"转义字符\"，也能引用变量${PERSON}"
echo -e ${string}
#字符串拼接
greeting="hello ${PERSON}"
echo ${greeting}
#字符串长度获取用#
echo "PERSON变量的长度是："${#PERSON}	
#字符串截取(开始:结束)
string="tyw is a little great"
echo ${string:0:9}${string:16:20}
#查找字符串,查找字符i或s的位置@@todo
string="Bilibili is a good website~"
echo `expr index "${string}" is`
echo 

echo "=================> 数组 array <======================="
#建立数组,元素用空格隔开
array=(1 2  a "a" "abc")
#读取数组
echo ${array[@]}
echo ${array[*]}
#获取数组长度
echo "整个数组长度:"${#array[*]}
echo "整个数组长度:"${#array[@]}
echo "第n个数组元素长度:"${#array[4]}
echo 

echo "==========> 格式化输出 format output <================"
#使用printf,需要用显式换行，参数用空格分隔
printf "hello, $1\n"
#单引号双引号效果一样
printf 'hello\n'
printf "hello\n"
#带参数
printf "my name is %s,I'm born in %i\n" "tangyw" 1992
printf 'my name is %s,I am born in %i\n' "tangyw" 1992
#没有指定参数，则用“空值”和0代替
printf 'my name is %s,I am born in %i\n'
echo

echo "==========> IO重定向  IO redirection <================"
echo ">>输出重定向"
#输出结果重定向到文件，用>，会覆盖原有内容
echo -e "this is some words will be covered">TestFile
who>TestFile
#不覆盖的话，用>>追加
echo -e "\nTest file.\nThis is some test word..">>TestFile
echo ">>输入重定向"
#用<
wc -l TestFile
wc -l < TestFile
#todo
echo

echo "==========> 函数 function <================"
#todo

echo "==========> 文件包含 file include <================"
#todo