#!/bin/bash

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

change_to_new()
{
 for host in `cat hostlist`
 do
        echo HOST $host
        ssh root@$host "su - storm -lc 'mv storm.yaml storm.yaml-old'"
        ssh root@$host "su - storm -lc 'mv storm.yaml-bak storm.yaml'"
 done
 return 0
}


change_to_old()
{
 for host in `cat hostlist`
 do
        echo HOST $host
        ssh root@$host "su - storm -lc 'mv storm.yaml storm.yaml-bak'"
        ssh root@$host "su - storm -lc 'mv storm.yaml-old storm.yaml'"
 done
 return 0
}
