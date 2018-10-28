#!/usr/bin/env bash
set -e

cd /opt/

[ -f VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz ] || sudo wget http://hkbk.oss-cn-hongkong.aliyuncs.com/VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz --referer=$1

[ -f vmware-vsphere-cli-distrib/vmware-install.pl ] || sudo tar xvf VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz

sudo vmware-vsphere-cli-distrib/vmware-install.pl EULA_AGREED=yes

