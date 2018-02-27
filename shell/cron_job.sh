#!/bin/Bash

#author:huozhenlin
#time:2018/02/25
#link:https://www.cnblogs.com/zdz8207/p/3282352.html

#定义一个要启动的服务名
threading="httpd"
#使用死循环，为真，执行do中的命令，否者，跳出死循环
while true;do
		#检测是否存在当前相关进程并输出条数
        count=`ps -ef|grep ${threading}|grep -v grep`
		#如果输出条数不为零
        if [ "$?" != "0" ];then
#输出该线程不存在信息
echo    ">>>>no ${threading},run it"
#执行启动命令
service ${threading} start
else
#否者，输出该线程没有启动
echo ">>>>%{threading} is runing..."
fi
sleep 5
done