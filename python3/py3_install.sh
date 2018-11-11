#!/usr/bin/bash
#一键安装python3.6.6脚本
echo '安装python3.6.6并设置python3'
echo '安装依赖库'
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
echo '下载python3.6.6'
wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tar.xz
#创建安装目录
mkdir /usr/local/python3
#解压并安装
tar -xvf Python-3.6.6.tar.xz
cd Python-3.6.6
./configure --prefix=/usr/local/python3
make && make install
#创建软链接
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
#更新pip
pip3 install --upgrade pip
#安装常用模块
pip3 install -r ~/requirements.txt
echo '安装完毕！'
