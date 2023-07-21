#!/bin/bash
while true
do
now=$(date +"%Y.%m.%d.%S.%N")
echo $now >> /dev/null
sleep 1 
done
