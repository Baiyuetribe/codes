#!/bin/bash                                                                                               
#===================================================================#
#   System Required:  CentOS 7                                 #
#   Description: Install v2ray for CentOS7 #
#   Author: Azure <2894049053@qq.com>                               #
#   github: @baiyutribe <https://github.com/baiyuetribe>                     #
#   Blog:  佰阅部落 https://baiyue.one                           #
#===================================================================#
#
#  .______        ___       __  ____    ____  __    __   _______      ______   .__   __.  _______ 
#  |   _  \      /   \     |  | \   \  /   / |  |  |  | |   ____|    /  __  \  |  \ |  | |   ____|
#  |  |_)  |    /  ^  \    |  |  \   \/   /  |  |  |  | |  |__      |  |  |  | |   \|  | |  |__   
#  |   _  <    /  /_\  \   |  |   \_    _/   |  |  |  | |   __|     |  |  |  | |  . `  | |   __|  
#  |  |_)  |  /  _____  \  |  |     |  |     |  `--'  | |  |____  __|  `--'  | |  |\   | |  |____ 
#  |______/  /__/     \__\ |__|     |__|      \______/  |_______|(__)\______/  |__| \__| |_______|
#
#一键脚本
# bash <(curl -L -s https://raw.githubusercontent.com/Baiyuetribe/v2ray_docker/master/v2ray.sh)             
# @安装docker
install_docker() {
    docker version > /dev/null || curl -fsSL get.docker.com | bash 
    service docker restart 
    systemctl enable docker  
}

# 单独检测docker是否安装，否则执行安装docker。
check_docker() {
	if [ -x "$(command -v docker)" ]; then
		echo "您的系统已安装docker"
		# command
	else
		echo "开始安装docker。。。"
		# command
		install_docker
	fi
}



#开始菜单
start_menu(){
    clear
	echo "


  ██████╗  █████╗ ██╗██╗   ██╗██╗   ██╗███████╗    ██████╗ ███╗   ██╗███████╗
  ██╔══██╗██╔══██╗██║╚██╗ ██╔╝██║   ██║██╔════╝   ██╔═══██╗████╗  ██║██╔════╝
  ██████╔╝███████║██║ ╚████╔╝ ██║   ██║█████╗     ██║   ██║██╔██╗ ██║█████╗  
  ██╔══██╗██╔══██║██║  ╚██╔╝  ██║   ██║██╔══╝     ██║   ██║██║╚██╗██║██╔══╝  
  ██████╔╝██║  ██║██║   ██║   ╚██████╔╝███████╗██╗╚██████╔╝██║ ╚████║███████╗
  ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝                                                            
    "
    echo -e "\033[43;42m ====================================\033[0m"
    echo -e "\033[43;42m 介绍：Docker一键安装脚本               \033[0m"
    echo -e "\033[43;42m 作者：Azure                          \033[0m"
    echo -e "\033[43;42m 网站：https://baiyue.one             \033[0m"
    echo -e "\033[43;42m Youtube/B站：佰阅部落                 \033[0m"
    echo -e "\033[43;42m 适合centos、ubuntu、debian           \033[0m"
    echo -e "\033[43;42m =====================================\033[0m"
    echo
    echo -e "\033[0;33m  确认请按回车键Enter；否则按Ctrl+C退出 \033[0m"
    echo
    read -p "是否继续？":" num
    case "$num" in
    *)
	check_docker
    echo -e "\033[32m====================================\033[0m"	
    echo -e "\033[32m 恭喜，您已经完成docker的安装                        "
    echo -e "\033[32m====================================\033[0m"	
	;;
    esac
}

start_menu
