#!/bin/bash
##说明脚本需要的解释器：bash
###########################################################
##
## One hour shell tutorial
## Author:tyw66 2639144635@qq.com
## Create date：2017-03-23
##
## Reference:
##	http://c.biancheng.net/cpp/shell/
##      http://man.linuxde.net/
##
## 有任何错误或可以改进的地方，欢迎向我提出～ths～
###########################################################
clear

echo "==========> 文件包含 file include <================"
#通过source命令或者. 命令引入其他文件
source ./function.sh

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
echo "【变量替换】"
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
echo "【for循环】"
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

echo "【while循环】"
#while循环，while后面要有空格
COUTER=0
while [ ${COUTER} -lt 5 ]
do 
	COUTER=`expr ${COUTER} + 1`
	echo -e ${COUTER}" \c"
done
echo

echo "【until循环】"
#until循环，until后面要有空格
NUMBER=0
until [ ! $NUMBER -lt 10 ]
do 
	echo -e ${NUMBER}" \c"
	NUMBER=`expr ${NUMBER} + 1 `
done

#跳出循环 break；跳出第n层循环 break n;默认跳出最大循环
#继续循环 continue
echo "【break 跳出循环】"
while :
do
	echo -n "Input a number between 1 to 5:"
	read aNum
	case $aNum in
		1|2|3|4|5) 
			echo "your number is ${aNum}!"	
			;;
		*) 
			echo "You do not select a number between 1 to 5." 
			echo "game over!"
			break			
		;;
	esac
done

echo

echo "==================> 判断  <======================="
echo "【if 判断】"
echo $1
#if语句
if [ $1 ] ; then		#等价于if [ $1 != "" ]
	if [ $1 == 'tyw66' ] ;	then
		echo "hello author!"
	else
		echo "hello $1!"
	fi
else
	echo "hello world!"
fi


#if语句判断文件夹存在
if [ -d ./test ] ; then
	rm -rf ./test
fi
#if语句判断文件存在
if [ -f ./TestFile ] ; then
	rm -rf ./TestFile
fi


echo "【if test 判断】"
#if test，test检验条件是否成立
num1=2*3
num2=1+5
if test $[num1] -eq $[num2]
then
	echo 'the two numbers are equal.'
else
	echo "the to numbers are not equal."
fi

echo "【case 判断】"
#case esac
echo -n "Input a number between 1 to 5:"
read varNum
case ${varNum} in
	# 匹配的模式以）结束，执行到;;处结束
	1) echo "your select is 1"	;;
	2) echo "your select is 2"	;;
	3) echo "your select is 3"	;;
	4) echo "your select is 4"	;;
	#如过没有匹配到，则用*号捕获该值
	*) echo "your select is *"	;;
esac


##另一个例子
option="${1}"
case ${option} in
	-f) FILE="${2}"
		echo "file name is ${FILE}"
		;;
	-d) DIR="${2}"
		echo "Dir name is ${DIR}"
		;;
	*)
		echo "`basename ${0}`:usage:[-f file] | [-d directory]"
		##exit 1 #退出脚本
		;;
esac
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
echo "date uptime is ${UP}"
#CommandA && CommandB 表示如果执行A成功，就执行B
#CommandA || CommandB 表示如果执行A失败，就执行B
UP=`date || uptime`
echo "uptime is ${UP}"

echo 

echo "===============> 运算符 operator <===================="
echo "【算术运算符】"
#expr命令实现简单计算。注意表达式与运算符之间要有空格，被` `包含
#表达式在方括号之间，要有空格
val=`expr 2 + 1`
echo "2+2= ${val}"
#乘号左边需要加反斜杠\
a=2
b=20
echo "2*20+2+1= "`expr ${a} \* ${b} + ${val}`
#求余
echo "${b}除以${val}的余数是："`expr ${b} % ${val}`
##awk todo

echo "【(数字的)关系运算符】"
a=1
b=2
#不能直接echo,下面不会输出true/false
echo [ $a -eq $b ]
#关系运算符有：-eq -ne -gt -lt -ge -le
#表示：=、!=、>、<、>=、<=
for var in -eq -ne -gt -lt -ge -le
do
	if [ ${a} ${var} ${b} ]  #注意空格
	then
		echo ${a}  ${var}  ${b} "= true"
	else
		echo ${a}  ${var}  ${b} "= false"
	fi
done

echo "【布尔运算符】"
#与：-a
if [ `expr 1+1`==2 -a  `expr 1+1`!=2 ]
then
	echo "1+1=2 and 1+1!=2 : true"		
else
	echo "1+1=2 and 1+1!=2 :false"
fi
#或：-o
if [ `expr 1+1`==2 -o  `expr 1+1`!=2 ]
then
	echo "1+1=2 or 1+1!=2 : true"		
else
	echo "1+1=2 or 1+1!=2 :false"
fi
#非：!
if [ !false ]
then
	echo "!false=true"		
else
	echo "uhhh..."
fi
echo

echo "【字符串运算符】"
#todo
echo "【文件测试运算符】"
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
echo "【输出重定向】"
#输出结果重定向到文件，用>，会覆盖原有内容
echo -e "this is some words will be covered">TestFile
who>TestFile
#不覆盖的话，用>>追加
echo -e "\nTest file.\nThis is some test word..">>TestFile
echo "【输入重定向】"
#用<
wc -l TestFile
wc -l < TestFile
#一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件： 
#标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
#标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
#标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。
#todo
echo

echo "==========> 函数 function <================"
hello
helloN 6




echo "=================End======================"



