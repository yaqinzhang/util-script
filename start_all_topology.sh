#!/bin/bash

if [ $# -eq 0 ]
 then
        echo "USAGE: start_all_topology.sh file_name" 
        exit 1;
 else
        host=$1
        start_all
        echo "Have stoped all topologies";
fi

start_all()
{
 echo HOST $host
 while read topology
 do
        echo $topology
        ssh root@$host "su - storm -c /usr/local/goldmine/storm/default/bin/$topology" < /dev/null
 done < topologies_script_list
 return 0
}
