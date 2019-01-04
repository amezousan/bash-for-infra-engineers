#!/bin/bash

hosts=( "host1" "host2" "host3")
ips=( "192.168.0.1" "192.168.0.2" "192.168.0.3" )
cnt=0

for i in "${hosts[@]}"
do
    echo "Ping to" ${i}:${ips[$cnt]}
    result=`ping -c 1 -w 1 ${ips[$cnt]}`
    result_grep=$(echo $result | awk '{sub("PING.*.received, ", "");print $0;}')

    if [ -z "$result_grep" ]; then
        echo "Failed"
    else
        echo "   --> $result_grep"
    fi

    cnt=`expr ${cnt} + 1`
    echo ""
done
