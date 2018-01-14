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
