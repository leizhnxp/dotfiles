#!/usr/bin/env bash

set -x

VER=v5.12.1

mkdir -p ~/opt/v2ray/$VER
cd ~/opt/v2ray/$VER

wget https://mirror.ghproxy.com/https://github.com/v2fly/v2ray-core/releases/download/$VER/v2ray-linux-64.zip

