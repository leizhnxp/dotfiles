#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if an argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 {on|off} [proxy_address]"
  exit 1
fi

# Set default proxy address
proxy_address="127.0.0.1:7890"
noproxy_address="localhost,127.0.0.1,.aliyun.com,.aliyuncs.com"

# Update proxy address if provided
if [ "$1" == "on" ] && [ -n "$2" ]; then
  proxy_address="$2"
fi

# Function to configure proxy
configure_proxy() {
  mkdir -p /etc/systemd/system/docker.service.d
  cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://$proxy_address/"
Environment="HTTPS_PROXY=http://$proxy_address/"
Environment="NO_PROXY=$noproxy_address"
EOF
  systemctl daemon-reload
  systemctl restart docker
  echo "Docker proxy configuration applied."
}

# Function to remove proxy
remove_proxy() {
  rm -f /etc/systemd/system/docker.service.d/http-proxy.conf
  systemctl daemon-reload
  systemctl restart docker
  echo "Docker proxy configuration removed."
}

# Apply configuration based on argument
case "$1" in
  on)
    configure_proxy
    ;;
  off)
    remove_proxy
    ;;
  *)
    echo "Invalid argument. Usage: $0 {on|off} [proxy_address]"
    exit 1
    ;;
esac

exit 0

