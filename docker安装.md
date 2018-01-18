---
date: 2018-01-15 08:59
status: public
title: docker安装
---

# CentOS6.5 docker安装  
* 安装yum源  
yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm  
* 执行安装 
yum install docker-io  
## docker常用命令  
* 启动docker 

![](~/09-02-49.jpg)
* 查看docker版本 
docker version  
* 查看安装的软件 
yum list installed | grep docker  
* 删除软件包 
yum -y remove docker-io.x86_64  
* 删除镜像容器等 
rm -rf /var/lib/docker  
## 其他可能发生的问题  
[安装docker后测试pull个镜像发现报错](http://blog.51cto.com/wangzhao/1772261)
[root@localhost ~]# /etc/init.d/docker status
Cannot connect to the Docker daemon. Is 'docker -d' running on this host?
报错解决：
（1）、查看docker状态
[root@localhost ~]# /etc/init.d/docker status
docker 已死，但 pid 文件仍存
（2）、查看日志文件
/usr/bin/docker: relocation error: /usr/bin/docker: symbol dm_task_get_info_with_deferred_remove, version Base not defined in file libdevmapper.so.1.02 with link time reference    
注：这个问题我百度过google过，网上说是安装或更新device-mapper和device-mapper-libs，我查看了一下我已经安装了，而且这个包在/lib64目录下，之后我重启了一下就好了，但是又报了一个错误，网友的回答也是安装最新的device-mapper和device-mapper-libs包（当时我系统中安装的这两个软件的版本是“1.02.77-9.el6”更新提示也是最新版本）。
这是重启之后的错误：
fatal error: unexpected signal during runtime execution
[signal 0xb code=0x1 addr=0x0 pc=0x0] 
这是我的解决方法：
我猜测可能我的这个软件包版本还是不能和docker相兼容，所以我在网上下载了一些rpm包手动安装。
关闭docker：
（1）、删除pid、sock文件
[root@localhost ~]# rm  /var/run/docker.*
rm：是否删除普通文件 "/var/run/docker.pid"？y
rm：是否删除套接字 "/var/run/docker.sock"？y
[root@localhost ~]# /etc/init.d/docker status
docker 已死，但是 subsys 被锁
[root@localhost ~]# rm  /var/lock/subsys/docker 
 rm：是否删除普通空文件 "/var/lock/subsys/docker"？y
[root@localhost ~]# /etc/init.d/docker status
 docker 已停
（2）、安装或更新device-mapper和device-mapper-libs
 我采用的是centos 6.5 ，下面是我下载的新版本的rpm包（比我所使用的要新）。
device-mapper-libs-1.02.95-3.el6_7.1.x86_64.rpm
device-mapper-1.02.95-3.el6_7.1.x86_64.rpm
（3）、开始安装：
rpm --nodeps -ivh device-mapper-1.02.95-3.el6_7.1.x86_64.rpm 
rpm --nodeps -ivh device-mapper-libs-1.02.95-3.el6_7.1.x86_64.rpm 
（4）、启动docker：
[root@localhost ~]# service docker start
Starting docker:                                       [确定]
（5）、查看docker状态和进程： 
[root@localhost ~]# service docker status
docker (pid  3600) 正在运行...
[root@localhost ~]# ps -ef | grep   docker | grep -v grep
root      3600     1  0 15:13 pts/0    00:00:00 /usr/bin/docker -d
成功启动docker，问题解决。
以上所提device-mapper和device-mapper-libs包链接如下：http://www.rpmfind.net/linux/rpm2html/search.php?query=device-mapper
http://www.rpmfind.net/linux/rpm2html/search.php?query=device-mapper-libs
问题解决继续pull个centos镜像：
[root@localhost ~]# docker pull centos
latest: Pulling from centos
47d44cb6f252: Pull complete 
47d44cb6f252: Download complete 
8aa7f4a1dd13: Download complete 
e0f5867add13: Download complete 
eeb3a076a0be: Download complete 
Status: Downloaded newer image for centos:latest
下载完成。
查看镜像信息：
[root@localhost ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              latest              686477c12982        7 days ago          120.7 MB
centos              latest              eeb3a076a0be        5 weeks ago         196.7 MB



注：pull不加TAG默认为latest
## 使用国内镜像加速 
[Docker 版本在 1.12 或更高](http://blog.csdn.net/small_to_large/article/details/77334973)
修改 /etc/docker/daemon.json 文件并添加上 registry-mirrors 键值。
$ vim /etc/docker/daemon.json
 
> {
"registry-mirrors": ["https://registry.docker-cn.com"]
}
## 其他参考资料 
[csdn](http://www.linuxidc.com/Linux/2015-01/111091.htm)