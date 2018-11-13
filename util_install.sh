#!/usr/bin/bash

#安装一些常用的工具
yum install -y wget #安装wget下载工具
yum install -y tree #查看目录树
yum install -y tar unzip zip#压缩解压工具
yum -y  install lsof #查看端口占用情况
yum install -y bash-completion #使用systemctl自动补全服务名称
