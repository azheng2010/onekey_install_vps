#!/usr/bin/bash

#安装libaio库文件
yum install libaio* -y
#===================
#卸载自带的Mariadb
#===================
# 查询出来已安装的mariadb  
rpm -qa|grep mariadb
# 卸载mariadb
rpm -e --nodeps mariadb-libs-5.5.60-1.el7_5.x86_64  
#删除 etc目录下的 my.cnf
rm /etc/my.cnf 

#创建mysql用户组
groupadd mysql
#创建mysql用户并加入mysql用户组
useradd -g mysql mysql 
#===================
#下载安装mysql
#===================
#下载安装包
wget -c -t0 https://cdn.mysql.com//Downloads/MySQL-5.6/mysql-5.6.39-linux-glibc2.12-x86_64.tar.gz
#移动压缩包到/usr/local/目录
mv mysql-5.6.39-linux-glibc2.12-x86_64.tar.gz  /usr/local/
#解压安装包
cd /usr/local/
tar -zxvf mysql-5.6.39-linux-glibc2.12-x86_64.tar.gz 
#将解压好的文件夹重命名为mysql
mv mysql-5.6.39-linux-glibc2.12-x86_64 mysql
#复制my.cnf
#cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf 
#这里把下载到/root/my.cnf复制到/etc/my.cnf
cp /root/my.cnf /etc/my.cnf

#进入安装 mysql软件目录,安装数据库
cd /usr/local/mysql
#修改当前目录拥有着为mysql用户 
chown -R mysql:mysql /usr/local/mysql/ 
/usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql/ --datadir=/usr/local/mysql/data/  --defaults-file=/etc/my.cnf
#修改当前 data目录的拥有者为 mysql用户
chown -R mysql:mysql /usr/local/mysql/data/
#
#错误解决过程
cd /usr/local/mysql
chown -R mysql.mysql .
su - mysql
cd /usr/local/mysql
scripts/mysql_install_db
/usr/local/mysql/bin/mysqld_safe --user=mysql &
/etc/rc.d/init.d/mysqld status
/etc/rc.d/init.d/mysqld start
#===================
#配置 MySQL
#===================
#授予 my.cnf最大权限
cd ~
chown 777 /etc/my.cnf
#复制启动脚本到资源目录
cd /usr/local/mysql
cp /usr/local/mysql/support-files/mysql.server /etc/rc.d/init.d/mysqld 
#增加 mysqld 服务控制脚本执行权限
chmod +x /etc/rc.d/init.d/mysqld 
#将 mysqld 服务加入到系统服务
chkconfig --add mysqld
chkconfig mysqld on
#检查 mysqld 服务是否已经生效
chkconfig --list mysqld 

#创建文件夹
mkdir /var/lib/mysql
#给文件夹赋权限
chmod 777  /var/lib/mysql
#===================
#启动 mysqld 
#===================
#命令为:service mysqld start和service mysqld stop
service mysqld start
#service mysqld stop 

