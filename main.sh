#!/usr/bin/bash

#更新系统
yum -y update
#安装wget工具
yum install wget
#一键安装SSR翻墙工具
wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/ssr/ssr.sh && chmod +x ssr.sh && bash ssr.sh
#一键防火墙配置
wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/firewall/iptables && wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/firewall/firewall_config.sh && chmod +x firewall_config.sh && bash firewall_config.sh
#一键安装python3
wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/python3/py3_install.sh && wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/python3/requirements.txt && chmod +x py3_install.sh && bash py3_install.sh
#安装mysql
wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/mysql/mysql_install.sh && chmod +x mysql_install.sh && bash mysql_install.sh
