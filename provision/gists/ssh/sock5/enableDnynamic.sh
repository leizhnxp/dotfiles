#!/bin/bash


# 检查1080端口是否已经被ssh -D占用，如果有则跳过直接设置环境变量https_proxy，没有则创建
if lsof -i:1080 >/dev/null; then
    echo "Port 1080 is already in use, skipping ssh -D"
else
    echo "Port 1080 is not in use, starting ssh -D"
    ssh -D 1080 azure-p1st -N -f
fi

# 设置环境变量https_proxy
echo 执行命令设置环境变量：export https_proxy=socks5h://127.0.0.1:1080

