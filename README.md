# onekey_install_vps

VPS服务器一键安装脚本

此脚本在CentOS 7.x 64bit 版本服务器上成功实践过，可放心使用。

使用root账号SSH登录服务器

**首先修改root密码**

passwd

**二、更新系统**

yum -y update

**三、安装wget工具**

yum install wget

**四、一键安装SSR翻墙工具**

wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/ssr/ssr.sh && chmod +x ssr.sh && bash ssr.sh

这里需要注意一下，更改centos6或者centos7防火墙规则，把ssr端口加进去！否则服务器重启后就没法用了。
centos7默认使用的是firewall防火墙，这里我们改成centos6使用的iptables防火墙。

wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/firewall/iptables && wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/firewall/firewall_config.sh && chmod +x firewall_config.sh && bash firewall_config.sh

**五、一键安装python3**

`其中requirements.txt为常见的第三方python模块`

wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/python3/py3_install.sh && wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/python3/requirements.txt && chmod +x py3_install.sh && bash py3_install.sh

**六、安装mysql**

在CentOS7上一键安装MySQL5.6

wget -N --no-check-certificate https://raw.githubusercontent.com/azheng2010/onekey_install_vps/master/mysql/mysql_install.sh  && chmod +x mysql_install.sh && bash mysql_install.sh

（未完待续）
