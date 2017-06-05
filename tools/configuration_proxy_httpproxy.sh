#!/usr/bin/env bash

ssh -CnfNL 7777:localhost:8888 antiGFW@$1
export http_proxy=socks5://127.0.0.1:7777 https_proxy=socks5://127.0.0.1:7777

