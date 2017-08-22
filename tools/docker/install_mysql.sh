#!/usr/bin/env bash

# https://hub.docker.com/_/mysql/

PASSWD=`</dev/urandom tr -dc '[:graph:]' | head -c12`

echo write the root password $PASSWD

docker run \
    --name mysql-3306 \
    --publish=3306:3306 \
    -e MYSQL_ROOT_PASSWORD=$PASSWD -d \
    mysql

