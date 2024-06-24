#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check if both username and public key are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <public_key>"
    exit 1
fi

USERNAME=$1
PUBLIC_KEY=$2

# Check if the user exists
if ! id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' does not exist."
    exit 1
fi

# Ensure the user's .ssh directory exists
USER_HOME=$(eval echo ~$USERNAME)
SSH_DIR="$USER_HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    mkdir -p "$SSH_DIR"
    chown "$USERNAME":"$USERNAME" "$SSH_DIR"
    chmod 700 "$SSH_DIR"
fi

# Add the public key to the user's authorized_keys file
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"
if [ ! -f "$AUTHORIZED_KEYS" ]; then
    touch "$AUTHORIZED_KEYS"
    chown "$USERNAME":"$USERNAME" "$AUTHORIZED_KEYS"
    chmod 600 "$AUTHORIZED_KEYS"
fi

# Add the public key if it is not already in the authorized_keys file
if ! grep -q "$PUBLIC_KEY" "$AUTHORIZED_KEYS"; then
    echo "$PUBLIC_KEY" >> "$AUTHORIZED_KEYS"
    echo "Public key added for user '$USERNAME'."
else
    echo "The public key is already present for user '$USERNAME'."
fi

