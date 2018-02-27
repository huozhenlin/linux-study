#coding:utf8
import os
from time import sleep

'''
定义一个shell执行类
'''
class Shell_run:

    '''
    void_name:exec_command
    param_name:服务名关键字
    '''
    def exec_command(self,key):
        while 1:
            count=os.system('ps -ef|grep '+key+'|grep -v grep')
            if count!=0 :
                print ">>>>no {},run it".format(key)
                command='service '+key+' start >>service.log 2>&1'
                print(command)
                # os.system(command)
                sleep(5)
            else:
                print('>>>>{} is runing...').format(key)
                break
shell=Shell_run()
shell.exec_command('httpd')