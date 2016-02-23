#!/bin/bash

start_all()
{
 for host in `cat $hostlist`
 do
        echo HOST $host
        ssh root@$host "rm -rf /opt/data/goldmine/storm/local-dir/*  /opt/data/goldmine/storm/logs/*" < /dev/null
        ssh root@$host "su - storm -lc 'nohup /usr/local/goldmine/storm/default/bin/storm supervisor &'" < /dev/null &
        echo "start $host supervisor"
 done
 return 0
}

if [ $# -eq 0 ]
 then
        echo "USAGE: start_all_supervisor.sh file_name"
        exit 1;
 else
        hostlist=$1
        start_all
        echo "start all finished!"
fi
