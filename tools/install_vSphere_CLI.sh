#!/usr/bin/env bash

cd /opt/
sudo wget http://hkbk.oss-cn-hongkong.aliyuncs.com/VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz --referer=$1 &&
sudo tar xvf VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz && 
sudo vmware-vsphere-cli-distrib/vmware-install.pl &&
sudo rm -rf VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz

