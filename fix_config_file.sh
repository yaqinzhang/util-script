#!/bin/bash

path="/usr/local/goldmine/storm/default/conf"
change_to_new()
{
 for host in `cat $hostlist`
 do
        echo HOST $host
        ssh root@$host "su - storm -lc 'mv $path/storm.yaml $path/storm.yaml-old'"
        ssh root@$host "su - storm -lc 'mv $path/storm.yaml-bak $path/storm.yaml'"
 done
 return 0
}


change_to_old()
{
 for host in `cat $hostlist`
 do
        echo HOST $host
        ssh root@$host "su - storm -lc 'mv $path/storm.yaml $path/storm.yaml-bak'"
        ssh root@$host "su - storm -lc 'mv $path/storm.yaml-old $path/storm.yaml'"
 done
 return 0
}

if [ $# -ne 2 ]
 then
        echo "USAGE: fix_config_file.sh file_name old|new"
        exit 1;
 else
        hostlist=$1
        cmd=$2
        if [ "$cmd" == "old" ]
         then
                change_to_old
         else
                change_to_new
        fi
        echo "change configure finished!";
fi
