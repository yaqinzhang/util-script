#!/bin/bash

start_all()
{
 echo HOST $host
 while read topology
 do
        echo $topology
        ssh root@$host "su - storm -c '/usr/local/goldmine/storm/default/bin/$topology'" < /dev/null
 done < topologies_script_list
 return 0
}

if [ $# -eq 0 ]
 then
        echo "USAGE: start_all_topology.sh 10.**.**.**" 
        exit 1;
 else
        host=$1
        start_all
        echo "Have started all topologies";
fi
