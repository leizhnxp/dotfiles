#!/usr/bin/env bash

# ref : https://github.com/BlackReloaded/wsl2-ssh-pageant

sudo apt install socat

destination="$HOME/.ssh/wsl2-ssh-pageant.exe"
wget -O "$destination" "https://github.com/BlackReloaded/wsl2-ssh-pageant/releases/latest/download/wsl2-ssh-pageant.exe"
# Set the executable bit.
chmod +x "$destination"

