#!/usr/bin/env bash

# 检查是否提供了参数
if [ -z "$1" ]; then
  echo "Usage: $0 <email>"
  exit 1
fi

EMAIL=$1

# ref https://github.com/acmesh-official/acme.sh
curl -s https://get.acme.sh | bash -s email=$EMAIL

