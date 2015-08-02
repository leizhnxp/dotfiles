#!/usr/bin/env bash

cd
mkdir -p ~/oss/
mkdir -p ~/bin/
cd ~/oss/
wget "https://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/cn/oss/0.2.7/assets/sdk/OSS_Python_API_20150707.zip?spm=5176.730001.3.74.2uMOcb&Expires=1438524064&OSSAccessKeyId=80kJOHQaA4syuazx&Signature=DU6LOrSAsqjovLJPu9gwM1zCHHk%3D" -O OSS_Python_API_20150707.zip
unzip OSS_Python_API_20150707.zip
ln -s ~/oss/osscmd ~/bin/osscmd

