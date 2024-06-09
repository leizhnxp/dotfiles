#!/bin/bash

# 检查是否具有root权限
if [ "$EUID" -ne 0 ]; then
  echo "请使用root权限运行该脚本。"
  exit 1
fi

# 检查包管理器类型
if type apt > /dev/null 2>&1; then
  OS_TYPE="debian"
elif type dnf > /dev/null 2>&1; then
  OS_TYPE="rhel"
else
  echo "不支持的操作系统类型。"
  exit 1
fi

# 根据操作系统类型安装pam_ssh_agent_auth
if [ "$OS_TYPE" = "rhel" ]; then
  dnf install -y pam_ssh_agent_auth
elif [ "$OS_TYPE" = "debian" ]; then
  apt-get update
  apt-get install -y libpam-ssh-agent-auth
fi

# 配置pam_ssh_agent_auth
PAM_SSH_CONFIG="/etc/pam.d/sudo"
PAM_SSH_AGENT_AUTH_LINE="auth sufficient pam_ssh_agent_auth.so file=~/.ssh/authorized_keys"

# 在第二行插入一行空行
sed -i '2i\\' "$PAM_SSH_CONFIG"

# 在第三行插入注释
sed -i '3i# --- pam_ssh_agent_auth ---' "$PAM_SSH_CONFIG"

# 在第四行插入主要的编辑内容
sed -i "4i$PAM_SSH_AGENT_AUTH_LINE" "$PAM_SSH_CONFIG"

# 在第五行插入注释和一行空行
sed -i '5i# --- ---- --- \n' "$PAM_SSH_CONFIG"

# 提示配置成功
echo "pam_ssh_agent_auth 安装和配置完成。"

# 重新启动SSH服务
if [ "$OS_TYPE" = "rhel" ]; then
  systemctl restart sshd
elif [ "$OS_TYPE" = "debian" ]; then
  systemctl restart ssh
fi

echo "SSH服务已重新启动。"

