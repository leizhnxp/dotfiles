#!/bin/bash

# Define the configuration snippet to be added/removed
config="Host github.com
  Hostname ssh.github.com
  Port 443
  ProxyCommand ncat --proxy-type http --proxy 127.0.0.1:7890 %h %p"

# Define a function to add the configuration
add_config() {
  # Check if there is already a configuration for github.com
  grep_result=$(grep -A 3 "Host github.com" ~/.ssh/config)

  if [ -z "$grep_result" ]; then
    # If no configuration is found, add the configuration
    echo "$config" >> ~/.ssh/config
    echo "Added GitHub SSH over Proxy configuration."
  else
    # If configuration is found, output the configuration lines and prompt no changes
    echo "Configuration already exists, no changes made. Existing configuration:"
    echo "$grep_result"
  fi
}

# Define a function to remove the configuration
remove_config() {
  # Check if there is a github.com configuration that includes ncat
  grep_result=$(grep -A 3 "Host github.com" ~/.ssh/config | grep "ProxyCommand ncat")

  if [ -n "$grep_result" ]; then
    # If configuration is found, remove it
    sed -i.bak '/Host github.com/,+3d' ~/.ssh/config
    echo "Removed GitHub SSH over Proxy configuration."
  else
    # If no relevant configuration is found, output a prompt
    echo "No GitHub SSH over Proxy configuration found with ncat. Existing configuration:"
    grep -A 3 "Host github.com" ~/.ssh/config
  fi
}

# Check if ~/.ssh/config exists
if [ ! -f ~/.ssh/config ]; then
  touch ~/.ssh/config
fi

# Check the input parameter and call the respective function
case "$1" in
  on)
    add_config
    ;;
  off)
    remove_config
    ;;
  *)
    echo "Invalid parameter. Use 'on' to add the configuration or 'off' to remove the configuration."
    ;;
esac

