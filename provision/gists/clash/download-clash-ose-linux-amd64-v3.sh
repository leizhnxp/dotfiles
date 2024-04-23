#!/usr/bin/env bash

set -e

VER=v1.18.0
FNAME=clash-linux-amd64-v3-${VER}
ZNAME=${FNAME}.gz

mkdir -p ~/opt/clash
cd ~/opt/clash

# wget https://ghproxy.com/https://github.com/Dreamacro/clash/releases/download/${VER}/${ZNAME}
# sftp leizh@47.93.220.90:/home/leizh/opt/clash/backup/web/premium/clash-linux-amd64-v3-latest.gz ./
sftp zhenhua.lei@47.93.220.90:/home/zhenhua.lei/opt/clash/backup/web/core/clash-linux-amd64-v3-v1.18.0.gz ./
gunzip ${ZNAME}
chmod +x ${FNAME}
mkdir -p ~/bin/
cd ~/bin/
ln -sf ../opt/clash/${FNAME} clash
mkdir -p ~/.config/clash/
# scp leizh@47.93.220.90:/tmp/Country.mmdb ~/.config/clash/
wget https://mirror.ghproxy.com/https://github.com/Dreamacro/maxmind-geoip/releases/download/20230912/Country.mmdb
mv Country.mmdb ~/.config/clash
mkdir -p ~/etc/clash/
scp zhenhua.lei@47.93.220.90:/home/zhenhua.lei/etc/clash/flowss.yaml ~/etc/clash/

