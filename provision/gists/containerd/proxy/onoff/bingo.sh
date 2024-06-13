#!/bin/bash

# 检查是否具有 root 权限
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please run with sudo or as root user."
    exit 1
fi

# 获取命令行参数中的代理地址，如果没有提供，则使用默认值 http://127.0.0.1:1080
PROXY_ADDRESS=${2:-"http://127.0.0.1:1080"}

# 定义代理变量
HTTP_PROXY=$PROXY_ADDRESS
HTTPS_PROXY=$PROXY_ADDRESS
NO_PROXY="localhost,127.0.0.1,docker-registry.somecorporation.com"

# systemd service 文件路径
CONTAINERD_SERVICE_FILE="/etc/systemd/system/containerd.service"

# 检查 systemd 服务文件是否存在
if [ ! -f "$CONTAINERD_SERVICE_FILE" ]; then
    echo "containerd systemd service file not found. Please ensure containerd is installed and the path is correct."
    exit 1
fi

# 添加代理配置的函数
add_proxy() {
    # 检查是否已经有代理配置
    if grep -q 'HTTP_PROXY' "$CONTAINERD_SERVICE_FILE" || grep -q 'HTTPS_PROXY' "$CONTAINERD_SERVICE_FILE"; then
        echo "Proxies configuration already exists in the containerd service file. No changes made."
        exit 0
    fi

    # 备份原始的 systemd 服务文件
    cp "$CONTAINERD_SERVICE_FILE" "${CONTAINERD_SERVICE_FILE}.bak"

    # 插入代理环境变量到服务文件
    sed -i '/\[Service\]/a Environment="HTTP_PROXY='"$HTTP_PROXY"'"\nEnvironment="HTTPS_PROXY='"$HTTPS_PROXY"'"\nEnvironment="NO_PROXY='"$NO_PROXY"'"' "$CONTAINERD_SERVICE_FILE"

    echo "Proxy environment variables added to $CONTAINERD_SERVICE_FILE."
}

# 删除代理配置的函数
remove_proxy() {
    # 检查是否有代理配置
    if ! grep -q 'HTTP_PROXY' "$CONTAINERD_SERVICE_FILE" && ! grep -q 'HTTPS_PROXY' "$CONTAINERD_SERVICE_FILE"; then
        echo "No proxy configuration found in the containerd service file. No changes made."
        exit 0
    fi

    # 备份原始的 systemd 服务文件
    cp "$CONTAINERD_SERVICE_FILE" "${CONTAINERD_SERVICE_FILE}.bak"

    # 移除代理环境变量
    sed -i '/Environment="HTTP_PROXY/d' "$CONTAINERD_SERVICE_FILE"
    sed -i '/Environment="HTTPS_PROXY/d' "$CONTAINERD_SERVICE_FILE"
    sed -i '/Environment="NO_PROXY/d' "$CONTAINERD_SERVICE_FILE"

    echo "Proxy environment variables removed from $CONTAINERD_SERVICE_FILE."
}

# 根据第一个参数决定添加或移除代理配置
case "$1" in
    on)
        add_proxy
        ;;
    off)
        remove_proxy
        ;;
    *)
        echo "Usage: $0 {on|off} [proxy_address]"
        exit 1
        ;;
esac

# 重新加载 systemd 配置并重新启动 containerd 服务
systemctl daemon-reload
systemctl restart containerd

# 检查 containerd 服务状态
systemctl status containerd

