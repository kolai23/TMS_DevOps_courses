#!/bin/bash
ip add | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | sed 's/inet/ИП/g'
df -h | awk '{print $1,$4}' | sed 's/Filesystem Avail/Файловая_система  Доступно/g'
cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
memUsage=$(free -m | awk '/Mem/ {print $3}')
echo "Процесор: $cpuUsage%"
echo "Оперативная память: $memUsage MB"
