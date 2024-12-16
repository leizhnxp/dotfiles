#!/usr/bin/env bash

set -e

VER=v1.18.0
FNAME=mihomo-linux-amd64-compatible-v1.18.10
ZNAME=${FNAME}.gz

mkdir -p ~/opt/clash
cd ~/opt/clash
wget "https://github.com/MetaCubeX/mihomo/releases/download/v1.18.10/mihomo-linux-amd64-compatible-v1.18.10.gz" -O ${ZNAME}

gunzip ${ZNAME}
chmod +x ${FNAME}
mkdir -p ~/bin/
cd ~/bin/
ln -sf ../opt/clash/${FNAME} mihomo
mkdir -p ~/.config/clash/
cd ~/.config/clash/
wget "https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb"
mkdir -p ~/etc/clash/
scp zhenhua.lei@47.93.220.90:/home/zhenhua.lei/etc/clash/*.yaml ~/etc/clash/

