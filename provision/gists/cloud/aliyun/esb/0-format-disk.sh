#!/usr/bin/env bash

# ref https://help.aliyun.com/zh/ecs/user-guide/initialize-a-data-disk-whose-size-does-not-exceed-2-tib-on-a-linux-instance?spm=a2c4g.11186623.0.0.24d42337QboLU7

# 检查是否提供了设备名称作为参数
if [ $# -ne 1 ]; then
    echo "Usage: $0 <device>"
    exit 1
fi

# 提取设备名称
device=$1

# 检查设备是否存在
if [ ! -b "/dev/$device" ]; then
    echo "Device /dev/$device does not exist."
    exit 1
fi

# 创建临时目录
tmp_dir=$(mktemp -d)

# 输出分区格式化前的磁盘信息到临时文件和控制台
sudo parted /dev/$device print > "$tmp_dir/${device}_before.txt"
sudo parted /dev/$device print

# 格式化磁盘
sudo parted -s /dev/$device mklabel gpt mkpart primary 1 100%
sudo partprobe
sudo mkfs -t ext4 /dev/${device}1

# 输出分区格式化后的磁盘信息到临时文件和控制台
sudo parted /dev/$device print > "$tmp_dir/${device}_after.txt"
sudo parted /dev/$device print

# 使用 diff -y 对比显示分区前后的文件
diff -y "$tmp_dir/${device}_before.txt" "$tmp_dir/${device}_after.txt"

# 删除临时目录
rm -r "$tmp_dir"

