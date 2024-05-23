#!/usr/bin/env bash


# created by chatgpt https://chatgpt.com/share/f1f1a58b-4367-44c8-8290-1c7e8355e875

# 检查脚本是否以 root 身份运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 身份运行此脚本。"
  exit 1
fi

# 创建备份目录
backup_dir="/mnt/temp_home_backup"
mkdir -p $backup_dir

# 备份现有的 /home 数据
echo "备份现有的 /home 数据到 $backup_dir..."
rsync -av /home/ $backup_dir/

# 创建临时挂载点
temp_mount_point="/mnt/vdb"
mkdir -p $temp_mount_point

# 挂载 /dev/vdb 到临时挂载点
echo "挂载 /dev/vdb1 到临时挂载点 $temp_mount_point..."
mount /dev/vdb1 $temp_mount_point

# 将备份数据复制到 /dev/vdb
echo "将备份数据复制到 /dev/vdb..."
rsync -av $backup_dir/ $temp_mount_point/

# 取消挂载临时挂载点
echo "取消挂载临时挂载点..."
umount $temp_mount_point

# 获取 /dev/vdb 的 UUID
uuid=$(blkid -s UUID -o value /dev/vdb1)

# 编辑 /etc/fstab 文件
echo "编辑 /etc/fstab 文件以自动挂载 /dev/vdb 到 /home..."
echo "UUID=$uuid    /home    ext4    defaults    0    2" >> /etc/fstab

# 挂载新的 /home 分区
echo "挂载新的 /home 分区..."
mount /home

# 验证挂载
echo "验证 /home 是否已成功挂载..."
df -h | grep /home
ls /home

# 清理备份数据
echo "清理备份数据..."
rm -rf $backup_dir

echo "操作完成。"
