#!/usr/bin/env bash

# --------------------- 
# 作者：nklinsirui 
# 来源：CSDN 
# 原文：https://blog.csdn.net/nklinsirui/article/details/80581286 
# 版权声明：本文为博主原创文章，转载请附上博文链接！

cat << EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
# setenforce 0
# yum install -y kubelet kubeadm kubectl

