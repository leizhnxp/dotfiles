#!/usr/bin/env bash

# ref https://help.aliyun.com/zh/ecs/user-guide/resize-cloud-disks/?spm=a2c4g.11186623.0.0.6fbb714axD8MnU

# 检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# 参数设置
DISK=$1

if [ "$DISK" == "vda" ]; then
  PARTITION=3
elif [ "$DISK" == "vdb" ]; then
  PARTITION=1
elif [ "$DISK" == "vdc" ]; then
  PARTITION=1
else
  echo "Invalid disk. Please provide vda, vdb, or vdc."
  exit 1
fi

# 更新包索引
apt-get update

# 检查并安装所需的工具
type growpart >/dev/null 2>&1 || apt-get install -y cloud-guest-utils
type sgdisk >/dev/null 2>&1 || apt-get install -y gdisk

# 扩展分区
LC_ALL=en_US.UTF-8 growpart /dev/$DISK $PARTITION

# 调整文件系统大小
resize2fs /dev/${DISK}${PARTITION}

