#！/usr/bin/bash
#适用CentOS7修改防火墙，CentOS6本身使用iptables防火墙，只需添加规格即可

#CentOS 7.0默认使用的是firewall作为防火墙，这里改为iptables防火墙。

#1、关闭firewall：
systemctl stop firewalld.service #停止firewall
systemctl disable firewalld.service#禁止firewall开机启动
systemctl mask firewalld.service#注销firewall服务

#2、安装iptables防火墙
yum install iptables-services -y

#3.启动设置防火墙
systemctl enable iptables#设置自启动
systemctl start iptables#运行防火墙
systemctl start ip6tables；#启动ip6tables（不需要可以跳过）
systemctl enable ip6tables；#自启动ip6tables（不需要可以跳过）
#4.查看防火墙状态
systemctl status iptables

#5.编辑防火墙，增加端口
#vi /etc/sysconfig/iptables #编辑防火墙配置文件
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
#:wq! #保存退出

#此处采用替换配置文件的方法
#rm /etc/sysconfig/iptables
#cp ~/iptables /etc/sysconfig/iptables -f
mv ~/iptables /etc/sysconfig/iptables -f

#6.重启配置，重启系统
systemctl restart iptables.service #重启防火墙使配置生效
systemctl enable iptables.service #设置防火墙开机启动

echo '更改防火墙规则成功！'

#验证
systemctl status iptables#查看运行状态
cat /etc/sysconfig/iptables#查看规则文件
echo '查看防火墙规则文件，看看3306端口，8972端口有没有体现，有的话，就成功了！！！'
