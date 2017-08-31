# 数据库
## SQL语句

**数据库操作**
- 创建数据库
`CREATE DATABASE database-name`
- 删除数据库
`drop database dbname`
- 备份sql server

- 创建备份数据的device
`USE master`
`EXEC sp\_addumpdevice 'disk', 'testBack', 'c:\mssql7backup\MyNwind\_1.dat'`
- 开始 备份
`BACKUP DATABASE pubs TO testBack`

**表操作**
- 创建新表
`create table tabname\(col1 type1 \[not null\] \[primary key\],col2 type2 \[not null\],..\)`

- 根据已有的表创建新表：
A：`create table tab\_new like tab\_old \(使用旧表创建新表\)`
B：`create table tab\_new as select col1,col2… from tab\_old definition only`

- 删除新表
`drop table tabname`

- 增加一个列
`Alter table tabname add column col type`
*注：列增加后将不能删除。DB2中列加上后数据类型也不能改变，唯一能改变的是增加varchar类型的长度。*

- 添加主键
`Alter table tabname add primary key\(col\)`

- 删除主键
`Alter table tabname drop primary key\(col\)`

- 创建索引
`create \[unique\] index idxname on tabname\(col….\)`

- 删除索引
`drop index idxname`
*注：索引是不可更改的，想更改必须删除重新建。*

- 创建视图
`create view viewname as select statement`

- 删除视图
`drop view viewname`

**数据操作**

- 增: 
`Insert into 表名 Values\(‘项1’, ‘项2’, ‘项3’\)`

- 删:
`Delete from 表名 where 列名=‘项0’`

- 改:
`Update 表名 set 列1=’项1’,列2=’项2’ where 主键=’项0’`

- 查:
`select \* from 表名 where 列1=’项1’`
`select \* from表名 where 列1 like ’%值%’`

- 排序：
`select \* from table1 order by field1 \[desc\],field2 \[desc\]` //加desc表示降序

- 总数：
`select count\(列名/\*\) as totalcount from table1` //返回记录总数

- 求和：
`select sum\(列名\) as sumvalue from table1`

- 平均：
`select avg\(field1\) as avgvalue from table1`

- 最大：
`select max\(field1\) as maxvalue from table1`

- 最小：
`select min\(field1\) as minvalue from table1`

- like:
	- 'A\_Z':所有以 'A' 起头，另一个任何值的字原，且以 'Z' 为结尾的字串。 'ABZ' 和 'A2Z' 都符合这一个模式，而 'AKKZ' 并不符合 \(因为在 A 和 Z 之间有两个字原，而不是一个字原\)。
	- 'ABC%':所有以 'ABC' 起头的字串。举例来说，'ABCD' 和 'ABCABC' 都符合这个套式。
	- '%XYZ':所有以 'XYZ' 结尾的字串。举例来说，'WXYZ' 和 'ZZXYZ' 都符合这个套式。
	- '%AN%':所有含有 'AN' 这个套式的字串。举例来说， 'LOS ANGELES' 和 'SAN FRANCISCO' 都符合这个套式。



UNION运算符

通过组合其他两个结果表\(例如 TABLE1 和 TABLE2\)并消去表中任何重复行而派生出一个结果表。当 ALL 随 UNION 一起使用时\(即 UNION ALL\)，不消除重复行。两种情况下，派生表的每一行不是来自 TABLE1 就是来自 TABLE2。

EXCEPT运算符

通过包括所有在 TABLE1 中但不在 TABLE2 中的行并消除所有重复行而派生出一个结果表。当 ALL 随 EXCEPT 一起使用时 \(EXCEPT ALL\)，不消除重复行。

INTERSECT运算符

通过只包括 TABLE1 和 TABLE2 中都有的行并消除所有重复行而派生出一个结果表。当 ALL 随 INTERSECT 一起使用时 \(INTERSECT ALL\)，不消除重复行。

注：使用运算词的几个查询结果行必须是一致的。

使用外连接

A、left \(outer\) join：

左外连接\(左连接\)：结果集几包括连接表的匹配行，也包括左连接表的所有行。

SQL: select a.a, a.b, a.c, b.c, b.d, b.f from a LEFT OUT JOIN b ON a.a = b.c

B：right \(outer\) join:

右外连接\(右连接\)：结果集既包括连接表的匹配连接行，也包括右连接表的所有行。

C：full/cross \(outer\) join：

全外连接：不仅包括符号连接表的匹配行，还包括两个连接表中的所有记录。

分组:Group by:

一张表，一旦分组 完成后，查询后只能得到组相关的信息。

组相关的信息：\(统计信息\) count,sum,max,min,avg 分组的标准\)

在SQLServer中分组时：不能以text,ntext,image类型的字段作为分组依据

在selecte统计函数中的字段，不能和普通的字段放在一起;

分离数据库：

sp\_detach\_db;

附加数据库：

sp\_attach\_db后接表明，附加需要完整的路径名

修改数据库的名称:

sp\_renamedb 'old\_name', 'new\_name'



between限制查询数据范围时包括了边界值,not between不包括

select \* from table1 where time between time1 and time2

select a,b,c, from table1 where a not between 数值1 and 数值2



日期时间格式化:

FORMAT\(单井数据.日期,"yyyy"\)AS 年,

FORMAT\(单井数据.日期,"m"\)AS 月,

FORMAT\(单井数据.日期,"d"\)AS 日,

FORMAT\(单井数据.日期,"dddd"\)AS 星期,

FORMAT\(单井数据.日期,"h"\)AS 小时,

FORMAT\(单井数据.日期,"n"\)AS 分,

FORMAT\(单井数据.日期,"s"\)AS 秒