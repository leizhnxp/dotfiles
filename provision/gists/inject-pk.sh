#!/bin/bash

# 检查是否提供了两个参数
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> \"<public_key>\""
    exit 1
fi

USERNAME=$1
PUBLIC_KEY=$2

# 去掉双引号
PUBLIC_KEY=${PUBLIC_KEY#\"}
PUBLIC_KEY=${PUBLIC_KEY%\"}

# 检查用户名是否存在
if ! id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME does not exist."
    exit 1
fi

# 检查是否提供了公钥
if [ -z "$PUBLIC_KEY" ]; then
    echo "No public key provided."
    exit 1
fi

# 定义用户的 .ssh 目录和 authorized_keys 文件路径
USER_HOME=$(eval echo "~$USERNAME")
SSH_DIR="$USER_HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

# 创建 .ssh 目录（如果不存在）
if [ ! -d "$SSH_DIR" ]; then
    sudo mkdir -p "$SSH_DIR"
    sudo chmod 700 "$SSH_DIR"
    sudo chown "$USERNAME:$USERNAME" "$SSH_DIR"
    echo "Created .ssh directory for user $USERNAME."
fi

# 创建 authorized_keys 文件（如果不存在）
if [ ! -f "$AUTHORIZED_KEYS" ]; then
    sudo touch "$AUTHORIZED_KEYS"
    sudo chmod 600 "$AUTHORIZED_KEYS"
    sudo chown "$USERNAME:$USERNAME" "$AUTHORIZED_KEYS"
    echo "Created authorized_keys file for user $USERNAME."
fi

# 检查公钥是否已经存在，如果不存在则追加
if ! grep -q "$PUBLIC_KEY" "$AUTHORIZED_KEYS"; then
    echo "$PUBLIC_KEY" | sudo tee -a "$AUTHORIZED_KEYS"
    echo "Public key added for user $USERNAME."
else
    echo "Public key already exists for user $USERNAME."
fi

