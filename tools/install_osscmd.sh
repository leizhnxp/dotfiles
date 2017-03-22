#!/usr/bin/env bash

cd
mkdir -p ~/opt/oss/
mkdir -p ~/bin/
cd ~/opt/oss/
wget "https://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/internal/oss/0.0.4/assets/sdk/OSS_Python_API_20160419.zip?spm=5176.doc32171.2.3.ICamCL&file=OSS_Python_API_20160419.zip" -O OSS_Python_API.zip
unzip OSS_Python_API.zip
ln -s ~/opt/oss/osscmd ~/bin/osscmd

