#!/usr/bin/env bash


# ref : https://github.com/containerd/nerdctl/releases/tag/v2.0.2
wget https://github.com/containerd/nerdctl/releases/download/v2.0.2/nerdctl-full-2.0.2-linux-amd64.tar.gz

sudo tar Cxzvvf /usr/local nerdctl-full-2.0.2-linux-amd64.tar.gz
sudo systemctl enable --now containerd

sudo apt update
sudo apt install iptables

