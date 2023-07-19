#!/bin/bash
useradd -m $1
passwd $1
uname -rv > /home/$1/sysinfo
echo "================" >> /home/$1/sysinfo
lscpu | grep -P '(^CPU\(s\):|Model name|CPU MHz)' >> /home/$1/sysinfo
echo "================" >> /home/$1/sysinfo
free -h >> /home/$1/sysinfo
echo "================" >> /home/$1/sysinfo
lsblk >> /home/$1/sysinfo
~

