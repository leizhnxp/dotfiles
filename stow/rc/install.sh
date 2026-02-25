#!/bin/bash

# create a stowrc resource file if it doesn't exist
if [ -f "$HOME/.stowrc" ]; then
    echo "Stowrc resource file already exists at $HOME/.stowrc"
    exit 0
fi

echo "Creating stowrc resource file at $HOME/.stowrc"
touch "$HOME/.stowrc"

# Script directory: <repo>/stow/rc
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Stow root: <repo>/stow
STOW_ROOT="$(dirname "$SCRIPT_DIR")"
# Stow packages directory: <repo>/stow/pkgs
STOW_PACKAGES_DIR="$STOW_ROOT/pkgs"

if [ ! -d "$STOW_PACKAGES_DIR" ]; then
    echo "Error: stow packages directory not found: $STOW_PACKAGES_DIR" >&2
    exit 1
fi

# Fill .stowrc with stow package dir and target dir
echo "--dir=$STOW_PACKAGES_DIR" >> "$HOME/.stowrc"
echo "--target=$HOME" >> "$HOME/.stowrc"
