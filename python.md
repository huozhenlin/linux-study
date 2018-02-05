---
date: 2018-01-19 10:26
status: public
title: python
---

# Python安装
[csdn教程](https://www.cnblogs.com/workingdiary/p/6855362.html)
# 建立软链接  
ln -s /usr/local/python27/bin/pip  /usr/bin/pip  
# pip安装 
[csdn教程](http://blog.csdn.net/u013372487/article/details/51726002)
## pip下载
> wget "https://pypi.python.org/packages/source/p/pip/pip-1.5.4.tar.gz#md5=834b2904f92d46aaa333267fb1c922bb" --no-check-certificate  
## pip安装 
> tar -xzvf pip-1.5.4.tar.gz
cd pip-1.5.4
python setup.py install
提示错误：
[sudo] password for dslab:  
Traceback (most recent call last):  
  File "setup.py", line 5, in <module>  
    from setuptools import setup, find_packages  
ImportError: No module named setuptools  
## 安装setup-tools 
> wget http://pypi.python.org/packages/source/s/setuptools/setuptools-2.0.tar.gz 
### 解压setuptools
> tar -zxvf setuptools.tar.gz 
### 编译setuptools 
> python setup.py build  
### setuptools安装 
> python setup.py install 
## 最后，安装pip  
> cd pip-1.5.4/  
> python setup.py install  
## 无法使用pip请建立软链接  
ln -s /usr/local/python27/bin/pip  /usr/bin/pip

