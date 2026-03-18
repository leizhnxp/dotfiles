## --- copy from Ubuntu 24.04.3 LTS (WSL) 

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## --- --- ---

## --- copy from Alibaba Cloud Linux release 3 (OpenAnolis Edition)
# .bash_profile

## Get the aliases and functions
## if [ -f ~/.bashrc ]; then
##         . ~/.bashrc
## fi

# User specific environment and startup programs

## --- --- ---

## --- customizations --- my bash profile content
if [ -f "$HOME/.config/my-oh-bash/load.sh" ]; then
    . "$HOME/.config/my-oh-bash/load.sh"
fi

## --- customizations --- my stow completion
if [ -f "$HOME/.config/bash_completion.d/stow" ]; then
    . "$HOME/.config/bash_completion.d/stow"
fi

## --- --- ---

