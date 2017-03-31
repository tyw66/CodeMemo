function hello(){
	echo "hello shell!"
}

function helloN(){
	echo "The amout of the parameter is : $#" 
	echo "The all of the parameter are : $*" 
	var=0
	echo ${1}
	## ${1}一定要加括号，表示第几个参数
	#要加两个[ ]号，不然报错
	while [[ ${var} -lt ${1} ]]
	do
		echo -e "hello!"
		var=`expr ${var}+1`
	done
	echo
	return 0
}

