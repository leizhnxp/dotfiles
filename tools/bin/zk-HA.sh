#!/usr/bin/env bash

#zookeeper address
zkAddress=zk1.traffic.amap.com:2181,zk2.traffic.amap.com:2181,zk3.traffic.amap.com:2181
#connection timeout  in  Millseconds
connectTimeOut=60000
#session timeout  in  Millseconds
sessionTimeOut=60000
serverTimeOutOfRead=30
serverBackLog=50
serverServerBufferSize=8192
#path
zookeeperPath=/lock/autonavi/automotive/anypre
port=8964
bin_dir=`readlink -m $0 | xargs dirname`
app_dir=`dirname $bin_dir`
echo "app location : "$app_dir
data_dir=/home/admin/app/data
run="nohup java -Duser.dir=$app_dir -Xms2G -Xmx6G  -cp $app_dir/etc:$app_dir/lib/*:$data_dir:$data_dir/*.jar com.autonavi.tinfo.traffic.tpeg.zookeeper.DistributedZookeeper  $zkAddress $connectTimeOut $sessionTimeOut $zookeeperPath  $port  $serverBackLog $serverServerBufferSize $serverTimeOutOfRead classpath:ctx/**/*.xml"
log="$bin_dir/nohup.out"
len=`expr ${#app_dir} / 3`
app_dir_blur=`expr substr $app_dir 1 $len`
echo $app_dir_blur
shutdown="kill `ps -ef|grep java |grep $app_dir| awk '{print $2}'`"
sd_rb="kill `ps -ef|grep java |grep $app_dir_blur| awk '{print $2}'`"

case $1 in
	start)
		$run >> $log 2>&1 &
		;;
	stop)
		$shutdown
		;;
	restart)
		$shutdown &&
		$run >> $log 2>&1 &
		;;
	rb)
		$sd_rb &&
		$run >> $log 2>&1 &
		;;
	*)
		echo "usage: run.sh [start|stop|restart]"
esac

chmod 644 $log
