#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/590437/specifying-apt-proxy-from-the-command-line
# https://lei-zh.notion.site/apt-9a3c70e7455542f5b4d2b7d9ae213329?pvs=4
sudo apt update --option Acquire::HTTP::Proxy=http://127.0.0.1:1080

