#!/usr/bin/env bash

# created by chatgpt https://chatgpt.com/share/f1f1a58b-4367-44c8-8290-1c7e8355e875

# 更新并安装 rsync
sudo apt update
sudo apt install rsync -y

# 检查脚本是否以 root 身份运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 身份运行此脚本。"
  exit 1
fi

# 检查输入参数
if [ -z "$1" ]; then
  echo "请提供一个参数：vdb 或 vdc"
  exit 1
fi

disk=$1
if [ "$disk" != "vdb" ] && [ "$disk" != "vdc" ]; then
  echo "无效参数。请提供 vdb 或 vdc 作为参数。"
  exit 1
fi

if [ "$disk" == "vdb" ]; then
  mount_point="/home"
  backup_dir="/mnt/temp_home_backup"
elif [ "$disk" == "vdc" ]; then
  mount_point="/var"
  backup_dir="/mnt/temp_var_backup"
fi

# 检查磁盘是否已经格式化
if ! blkid /dev/${disk}1 &> /dev/null; then
  echo "/dev/${disk}1 未被格式化或不存在。请先格式化磁盘。"
  exit 1
fi

# 创建备份目录
mkdir -p $backup_dir

# 备份现有的数据
echo "备份现有的 $mount_point 数据到 $backup_dir..."
rsync -av $mount_point/ $backup_dir/

# 创建临时挂载点
temp_mount_point="/mnt/${disk}"
mkdir -p $temp_mount_point

# 挂载磁盘到临时挂载点
echo "挂载 /dev/${disk}1 到临时挂载点 $temp_mount_point..."
mount /dev/${disk}1 $temp_mount_point

# 将备份数据复制到新磁盘
echo "将备份数据复制到 /dev/${disk}..."
rsync -av $backup_dir/ $temp_mount_point/

# 取消挂载临时挂载点
echo "取消挂载临时挂载点..."
umount $temp_mount_point

# 获取新磁盘的 UUID
uuid=$(blkid -s UUID -o value /dev/${disk}1)

# 编辑 /etc/fstab 文件
echo "编辑 /etc/fstab 文件以自动挂载 /dev/${disk} 到 $mount_point..."
echo "UUID=$uuid    $mount_point    ext4    defaults    0    2" >> /etc/fstab

# 挂载新的分区
echo "挂载新的 $mount_point 分区..."
mount $mount_point

# 验证挂载是否成功
echo "验证 $mount_point 是否已成功挂载..."
df -h | grep $mount_point
ls $mount_point

# 清理备份数据
echo "清理备份数据..."
rm -rf $backup_dir

echo "操作完成。"

