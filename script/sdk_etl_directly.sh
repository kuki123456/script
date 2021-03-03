#!/usr/bin/env bash
#检查已经存在的ETL进程并kill掉
echo "#####Start Check!######"

nohup java -Dzk=Pre-N-147:2181,Pre-N-148:2181,Pre-N-237:2181 -Xms2g -Xmx4g -Xmn1g -Dlog.mode=debug -Dlog4j.level=info -Dtest.mode=false -Dapp.name=SDK_ETL -DmaxHistory=7d -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9090 -Dstata.open=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:+CMSScavengeBeforeRemark -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/br/logs/SDK_ETL -Xloggc:/data/br/logs/GC_SDK_ETL.log -Dlog_dir=/data/br/logs/SDK_ETL -jar /data/br/jar/SDK_ETL.jar 4 > /dev/null 2>&1 &