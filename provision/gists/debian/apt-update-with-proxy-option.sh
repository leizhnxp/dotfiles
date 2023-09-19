#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/590437/specifying-apt-proxy-from-the-command-line
sudo apt update --option Acquire::HTTP::Proxy=http://127.0.0.1:1080

