#!/bin/bash

set -e

# 参数（保持向后兼容）
username=${1:-"zhenhua.lei"}
publickey=${2:-"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbWEZygV6f+MENAwwP24NwGGMOqKC0XkH6DjEE7PVSA zhenhua.lei@GUI"}

# 普通用户脚本的GitHub raw URL
GITHUB_RAW_URL="https://raw.githubusercontent.com/leizhnxp/dotfiles/main/tidbits/create-regular-user.sh"

echo "🚀 通过增强版普通用户脚本创建超级用户..."

# 下载并执行普通用户脚本
temp_script="/tmp/create-regular-user-$$.sh"

if ! curl -fsSL "$GITHUB_RAW_URL" -o "$temp_script"; then
    echo "❌ 从GitHub下载普通用户脚本失败"
    exit 1
fi

chmod +x "$temp_script"

# 用我们的参数执行普通用户脚本
"$temp_script" "$username" "$publickey"

# 清理
rm -f "$temp_script"

# 提升为超级用户权限
filename=${username/\./""}   # 移除点号
filename=${filename/_/""}    # 移除下划线
filename=${filename/-/""}    # 移除连字符

# 添加到wheel/sudo组
set +e
sudo usermod -aG wheel "$username" || sudo usermod -aG sudo "$username"
set -e

# 创建超级用户sudoers文件（覆盖任何现有的）
sudo tee "/etc/sudoers.d/$filename" > /dev/null <<EOF
# $username 的超级用户权限
$username ALL=(ALL) ALL
Defaults:$username timestamp_timeout=1000
Defaults:$username env_keep += "SSH_AUTH_SOCK"
EOF

echo ""
echo "✅ 超级用户创建成功！"
echo "👤 用户名：$username"
echo "🔑 完整sudo权限，延长超时时间"
echo "📦 包含容器支持的subuid/subgid分配"
echo "🌟 包含普通用户脚本的所有高级功能"
echo ""