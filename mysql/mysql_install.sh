#!/usr/bin/bash
#本脚本适用于centos 7 安装mysql5.6
# 查询出来已安装的mariadb  
rpm -qa|grep mariadb
# 卸载mariadb
rpm -e --nodeps mariadb-libs-5.5.60-1.el7_5.x86_64  
#删除 etc目录下的 my.cnf
rm /etc/my.cnf 


#安装rpm包
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
#查看当前可用的mysql安装资源
yum repolist enabled | grep "mysql.*-community.*"
#mysql-connectors-community/x86_64 MySQL Connectors Community                 14
#mysql-tools-community/x86_64      MySQL Tools Community                      17
#mysql56-community/x86_64          MySQL 5.6 Community Server                139

#安装mysql
yum -y install mysql-community-server

#mysql基础配置
systemctl enable mysqld#开机启动
systemctl start mysqld#启动mysql服务
systemctl status mysqld#查看mysql状态

#配置mysql
echo "以下部分配置mysql，共有6步：
1. Enter current password for root [输入密码,直接回车]
2. Set root password?   [设置root用户密码] yes
3. Remove anonymous users?[删除匿名用户] yes
4. Disallow root login remotely?[禁止root远程登录] no
5. Remove test database and access to it?[删除test数据库] yes
6. Reload privilege tables now?[刷新权限] yes
"
read -s -n1 -p "按任意键继续 ... "

mysql_secure_installation

echo "授权远程登陆
在登录mysql后，在mysql>提示符下输入：
grant all privileges on *.* to 'wzh'@'%'identified by 'password' with grant option;
flush privileges ;
exit
即可实现授权远程用户wzh使用password来登录mysql数据库"

echo "登录mysql"
mysql -h localhost -u root -p




