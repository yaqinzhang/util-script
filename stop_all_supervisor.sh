#!/bin/bash

stop_all()
{
 for host in `cat $hostlist`
 do
        echo HOST $host
        ssh root@$host "su - storm -c jps | grep 'supervisor' | cut -d ' ' -f 1 | xargs kill -9"
 done
 return 0
}


if [ $# -eq 0 ]
 then
        echo "USAGE: stop_all_supervisor file_name"
        exit 1;
 else
        hostlist=$1
        stop_all
        echo "stop all finished!";
fi
