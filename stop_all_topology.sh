#!/bin/bash

if [ $# -eq 0 ]
 then
        echo "USAGE: stop_all_topology.sh 10.**.**.**"
        exit 1;
 else
        host=$1
        stop_all
        echo "Have stoped all topologies";
fi

stop_all()
{
 echo HOST $host
 while read topology
 do
        echo $topology
        ssh root@$host "su - storm -c /usr/local/goldmine/storm/default/bin/storm kill $topology" < /dev/null
 done < topologies_list
 return 0
}
