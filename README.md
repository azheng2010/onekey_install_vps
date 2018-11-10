# onekey_install_vps

VPS服务器一键安装脚本

适用于centOS6.x及以上版本

root登录服务器后。

**首先修改root密码**

passwd

**二、更新系统**

yum -y update

**三、安装wget**

yum install wget

**四、一键安装SSR翻墙工具**

wget -N --no-check-certificate https://github.com/azheng2010/onekey_install_vps/blob/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

**五、一键安装python3**

`其中requirements.txt为常见的第三方python模块`

wget -N --no-check-certificate https://github.com/azheng2010/onekey_install_vps/blob/master/py3install.sh && wget -N --no-check-certificate https://github.com/azheng2010/onekey_install_vps/blob/master/requirements.txt && chmod +x py3install.sh && bash py3install.sh
