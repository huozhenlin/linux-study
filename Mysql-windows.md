---
date: 2018-01-13 16:26
status: public
title: Mysql-windows
---

# Mysql基本命令
* 启动Mysql net start mysql
* 停止Mysql net stop mysql
* 查看版本 mysql -V
* 登录Mysql mysql -uroot -p -P3306
* 退出Mysql exit/quit/\q
* 修改提示符 prompt或mysql -uroot -proot --prompt \h  
# Mysql常用命令  
* 显示当前版本 SELECT VERSION()  
* 显示用户 SELECT USER()  
# 操作数据库  
* 创建数据库 CREATE {DATABASE|SCHEMA|[IF NOT EXISTS]
db_name [DEAFAULT] CAHRTSET [=] chartsetname  
> create database if not exists huo default charset=utf8;
* 修改字符编码
ALTER DATABASE databasename CHARTSET=charsetname;  
* 删除数据库  
DROP databasename;  
* 查看数据表  
SHOW TABLES/SHOW TABLES FROM databasename  
* 查看数据表结构  
SHOW COLUMNS FROM tablename  
* 插入数据 
INSERT INTO tablename VALUES(values)/INSERT INTO tablename(colunmname)VALUES(values)  
* 查看数据  
SELECT colunmname FROM tablename  
## 约束  
* 主键约束 PRIMARY KEY
* 外键约束 FOREIGN KEY  
## 修改列定义  
ALTER TABLE tablename MODIFY col_name column_definition  /
ALTER TABLE tablename CHANGE old_column_name new_column_name column_definition  
## 修改表名  
ALTER TABLE tablename RENAME new_name  
RENAME TABLE tablename TO new_tbl_name  
## 插入多条记录  
INSERT INTO tablename VALUES(),()  
## 更新记录

## 从其他表选择数据插入  
INSERT INTO tablename(columnname) SELECT FROM tablename WHERE +condition  
#约束
## 外键约束
REFERENCES  
## 增加列 
ALTER TABL tbl_name ADD COLUMN col_name col_defitine  
## 增加多列 
ALTER TABLE tbl_name ADD（，，，，，） 
## 删除列 
ALTER TABLE tbl_name DROP col_name 
ALTER TABLE tbl_name DROP col_name  
ALTER TABLE tbl_name DROP col_name,ADD CLOUMN  
## 添加约束 
ALTER TABLE ADD CONSTRAINT PRIMARY KEY(col_name)  
## 删除默认约束 
ALTER TABLE tbl_name ALTER col_name DROP DEAFAULT  
 

