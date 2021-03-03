import os
import time
import unittest
from BeautifulReport import BeautifulReport as bf
from script.br_sdk_druid import TestMysql_Br_sdk_druid
from script.zeusdb import ZeusDb
Base_dir = os.path.dirname(os.path.dirname(__file__))
print(Base_dir)
# 测试套件
suite = unittest.TestSuite()
# 添加用例
suite.addTest(unittest.makeSuite(TestMysql_Br_sdk_druid))

#suite.addTest(unittest.makeSuite(ZeusDb))
run = bf(suite) #实例化BeautifulReport模块
run.report(filename='../report/test{}'.format(time.strftime("%Y%m%d%H%M%S")),description='脚本检验')