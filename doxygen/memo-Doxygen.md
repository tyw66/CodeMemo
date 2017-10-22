# Doxygen备忘

## 下载与安装

## 一般步骤
- 生成配置文件Doxyfile: `doxygen (-s) -g`
- 建立目录结构, 比如Doxyfile文件\doc文件夹(输出)\src文件夹(放代码) ->三者在同一目录下
- 根据情况设置配置文件中的参数(关键)
- 运行`doxygen Doxyfile`生成大概结构
- 针对每个代码文件写doxygen注释
- 继续运行`doxygen Doxyfile`




## 配置文件Doxyfile设置
	DOXYFILE_ENCODING      = UTF-8
	PROJECT_NAME           = "Project Name"
	PROJECT_NUMBER         = 1.0
	PROJECT_BRIEF          = "This is a brief descript."
	EXTRACT_ALL            = YES
	OUTPUT_DIRECTORY       = "./doc"
	OUTPUT_LANGUAGE        = Chinese
	FULL_PATH_NAMES        = NO
	WARN_LOGFILE           ="./doc/build.log"
	INPUT                  ="./src"
	FILE_PATTERNS          =
	SOURCE_BROWSER         = NO
	GENERATE_LATEX         = NO
	CALL_GRAPH             = YES
	CALLER_GRAPH           = YES
	UML_LOOK               = YES
	RECURSIVE              = YES


## 各种注释规范
### 文件注释
		/**
		* Copyright (c) 2017, All rights reserverd.
		* 
		* @file $file$
		* @brief $brief$
		* Details.
		* 
		* @author  $author$,$email$
		* @date  $yy$-$mm$-$dd$
		* @version   $maj$.$min$
		*
		*************************************************/

### 命名空间
		/**
		* @brief $brief$
		* Details.
		**/

### 结构体\枚举
		/** 
		* @brief $brief$
		* Details.
		**/

### 类注释
		/**
		* @brief $brief$
		* Details.
		**/

### 成员变量注释
1. 在变量上面加
		/** 成员变量描述 */
2. 在变量后面加
		/**<成员变量描述 */

### 函数注释
		/** 
		* @brief $brief$-$test$
		* Details.
		* @param $param1$ : $param1_detail$
		* @param $param2$ : $param2_detail$
		* @return $return_detail$
		*        -<em>false</em> fail
		*        -<em>true</em>  succeed
		* @retval $return_note$
		* @deprecated $deprecated$
		* @see $see$
		* @pre $pre$
		**/

备注:
- note：指定函数注意项事或重要的注解指令操作符
	note格式如下：
		@note 简要说明

- retval：指定函数返回值说明指令操作符。(注:更前面的return有点不同.这里是返回值说明)
	retval格式如下：
		@retval 返回值 简要说明

- pre：指定函数前置条件指令操作符
	pre格式如下：
		@pre 简要说明

- par：指定扩展性说明指令操作符讲。（它一般跟code、endcode一起使用 ）
	par格式如下：
		@par 扩展名字

- code、endcode：指定
	code、endcode格式如下：
		@code
		简要说明(内容)
		@endcode

- see：指定参考信息。
	see格式如下：
		@see 简要参考内容

- deprecated：指定函数过时指令操作符。
	deprecated格式如下：
		@deprecated 简要说明　
		调试Bug说明
			解决的bug说明，@bug
		警告说明 (warning)
			定义一些关于这个函数必须知道的事情，@warning
		备注说明 (remarks)
			定义一些关于这个函数的备注信息，@remarks
		将要完成的工作 (todo)
			说明哪些事情将在不久以后完成，@todo
		使用例子说明 (example)
			例子说明，@example example.cpp


## 关键字收集
	@author          作者
	@brief             摘要
	@version         版本号
	@date             日期
	@file                文件名，可以默认为空，DoxyGen会自己加
	@class             类名
	@param           函数参数
	@return           函数返回值描述
	@exception      函数抛异常描述
	@warning         函数使用中需要注意的地方
	@remarks        备注
	@see               see also字段
	@note             brief下空一行后的内容表示详细描述，但也可以不空行用note表示
	@par               开始一个段落，段落名称描述由你自己指定，比如可以写一段示例代码
	@code             引用代码段
	@endcode        引用代码段结束
	@pre               函数前置条件，比如对输入参数的要求
	@post             函数后置条件，比如对系统状态的影响或返回参数的结果预期

	
	@param[in|out]     参数名及其解释
	@exception            用来说明异常类及抛出条件
	@return                   对函数返回值做解释
	@note                      表示注解，暴露给源码阅读者的文档
	@remark                表示评论，暴露给客户程序员的文档
	@since                   表示从那个版本起开始有了这个函数
	@deprecated        引起不推荐使用的警告
	@see                      表示交叉参考
