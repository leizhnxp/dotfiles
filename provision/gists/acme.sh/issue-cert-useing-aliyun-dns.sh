#!/usr/bin/env bash

# 检查是否提供了足够的参数
# $# 表示参数的数量，要求至少三个参数
if [ $# -lt 3 ]; then
  echo "Usage: $0 <Ali_Key> <Ali_Secret> <domain>"
#  echo "Example: $0 LTAIxxxxx OFW2xxxxx \\*.example.com"
  exit 1
fi

# 提取参数
ALI_KEY=$1       # 第一个参数作为 Ali_Key
ALI_SECRET=$2    # 第二个参数作为 Ali_Secret
DOMAIN=$3        # 第三个参数作为 domain

# 设置环境变量
export Ali_Key="$ALI_KEY"         # 设置 Ali_Key 环境变量
export Ali_Secret="$ALI_SECRET"   # 设置 Ali_Secret 环境变量

# 检查域名是否是以 *. 开头
if [[ "$DOMAIN" == \*.* ]]; then
  # 提取不带星号的域名
  DOMAIN_NO_WILDCARD=${DOMAIN:2}
  # 执行 acme.sh 命令，带两个 -d 参数
  ~/.acme.sh/acme.sh --issue --dns dns_ali -d "$DOMAIN_NO_WILDCARD" -d "$DOMAIN" 
else
  # 执行 acme.sh 命令，带一个 -d 参数
  ~/.acme.sh/acme.sh --issue --dns dns_ali -d "$DOMAIN"
fi

