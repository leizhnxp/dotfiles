#!/bin/bash

# Check if the required number of arguments is provided
if [ "$#" -lt 4 ]; then
    echo "Usage: $0 <login_user> <remote_host> <username> <public_key>"
    exit 1
fi

LOGIN_USER=$1
REMOTE_HOST=$2
USERNAME=$3
PUBLIC_KEY=$4

# set -x

# Execute the script on the remote server
# ssh "$LOGIN_USER@$REMOTE_HOST" "sudo /bin/bash /tmp/add_ssh_key.sh '$USERNAME' '$PUBLIC_KEY'"
ssh "$LOGIN_USER@$REMOTE_HOST" "curl -s https://raw.githubusercontent.com/leizhnxp/dotfiles/master/provision/gists/ssh/key/inject/to-exist-user.sh | sudo bash -s '$USERNAME' '$PUBLIC_KEY'"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "SSH key added successfully on remote host."
else
    echo "Failed to add SSH key on remote host."
    exit 1
fi


