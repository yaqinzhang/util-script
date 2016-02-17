#!/bin/bash

doCommand()
{
 for host in `cat hostlist`
 do
        echo ""
        echo HOST $host
        while read newhost
        do
                echo $newhost
                ssh root@$host "echo $newhost >> /etc/hosts" < /dev/null
        done < new_host_list
 done
 return 0
}
 doCommand
 echo "return from doCommand"
