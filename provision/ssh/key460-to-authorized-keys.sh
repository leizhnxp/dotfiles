#!/usr/bin/env bash

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
touch ~/.ssh/config

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config

public_key="AAAAB3NzaC1yc2EAAAADAQABAAABAQCfXvlBAIsE4/gQIvQT/I/3ZOptPK+gvhOMDd3pCFbcm4SfYXkUtSlmumuSWoP5XHBpSsBL9ZPYPpXzMrjMn0GcvV5PGu6sX7Ehv0mHB5I/AaLgrcbYcMR+T5JilssucXp/KJFJmT292m6f8fxWlVIFwxzO16RadMI48LGhW+iUFEoyvKz3f9Q0h5VzKRj/tg0qMq+AtatjT7ccd50iRONKsuY53JcFieRHZbbtuUVIcmjP/5phUzI8hAsURE3AxJgzVp092dwvtS7Jr56ArnAkPlLSfy/qTquigLrZXfTzWCuUEmBDowX1Gv/pm5+JK3F7x1pybFmy10RMZpqTeE/X"

grep $public_key ~/.ssh/authorized_keys && echo exist || $(echo ssh-rsa $public_key zhenhua.lei@working460 >> ~/.ssh/authorized_keys)

