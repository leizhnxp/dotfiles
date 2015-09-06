#!/usr/bin/env bash

self_dir=$(readlink -f $0|xargs dirname)
appl_dir=$(dirname $self_dir)
data_dir=~/
case $1 in
    start)
    java -Duser.dir=$appl_dir -Xms3G -Xmx3G -cp $appl_dir/:$appl_dir/data:$data_dir:$appl_dir/etc:$appl_dir/lib/* com.autonavi.tinfo.entry.ClassPathContextLoader  ctx/**/*.xml >> $self_dir/console.log 2>&1 &
    PID=$!
    echo $PID > $self_dir/pid 
    ;;
    stop)
    cat $self_dir/pid | xargs kill &&
    > $self_dir/pid
    ;;
    restart)
    sh $0 stop
    sh $0 start
    ;;
    *)
    echo "usage xxx.sh [start|stop|restart]"
esac
