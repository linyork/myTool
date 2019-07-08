#!/usr/bin/env bash
BASEDIR=$(dirname "$0")
cd "$BASEDIR"
clear

while :
do
    printf "\E[0;33m"
    echo ""

    echo "__   __          _     _____           _ "
    echo "\ \ / /___  _ _ | |__ |_   _|___  ___ | |"
    echo " \ V // _ \| '_|| / /   | | / _ \/ _ \| |"
    echo "  |_| \___/|_|  |_\_\   |_| \___/\___/|_|"
    printf "\E[0m"
    printf "\E[0;32m"
    echo " Welcome to use York tool. v1.0"
    echo "--------------------------------------------------"
    printf "\E[0m"

    echo -e "  \033[31m1.\033[0m    查詢目前使用中的 port 及 process id"
    echo -e "  \033[31m2.\033[0m    查詢特定 port 的服務"
    echo -e "  \033[31m3.\033[0m    查詢進程資訊"
    echo -e "  \033[31m4.\033[0m    查詢當前環境變量"
    echo -e "  \033[31m5.\033[0m    查詢 gorup"
    echo -e "  \033[31m6.\033[0m    查詢 linux 版本"

    printf "\E[0;32m"
    echo "--------------------------------------------------"
    printf "\E[0m"

    echo -e "  \033[31mq.\033[0m    離開"
    echo -e "  \033[31mc.\033[0m    清除畫面"

    printf "\E[0;32m"
    echo "--------------------------------------------------"
    printf "\E[0m"

    printf "\E[0;31m"
    read -p "Input:" input input2
    printf "\E[0m"

    clear
    case $input in
        1)
            lsof -n -i | grep LISTEN
            ;;
        2)
            if [  "$input2" == "" ]; then
                echo "\033[37;41m請輸入 port\033[0m"
            else
                lsof -n -i:$input2 | grep LISTEN
            fi
            ;;
        3)
            ps au
            ;;
        4)
            env | grep --color=auto =
            ;;
        5)
            cat /etc/group |awk -F ":" '{ print $1 "|" $3 "|" $4 }' | grep --color=auto '|'
            ;;
        6)
            cat /etc/*-release
            ;;
        c)
            clear
            ;;
        *)
            # 離開程序
            exit
            ;;
    esac
done
