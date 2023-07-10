1. Произвести минимальную настройку (время, локаль, custom motd)
[vagrant@localhost ~]$ sudo localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
[vagrant@localhost ~]$ localectl list-locales
en_AG
en_AG.utf8
en_AU
en_AU.iso88591
en_AU.utf8
en_BW
en_BW.iso88591
en_BW.utf8
en_CA
en_CA.iso88591
en_CA.utf8
en_DK
en_DK.iso88591
en_DK.utf8
en_GB
en_GB.iso88591
en_GB.iso885915
en_GB.utf8
en_HK
en_HK.iso88591
en_HK.utf8
en_IE
en_IE.iso88591
en_IE.iso885915@euro
en_IE.utf8
en_IE@euro
en_IN
en_IN.utf8
en_NG
en_NG.utf8
en_NZ
en_NZ.iso88591
en_NZ.utf8
en_PH
en_PH.iso88591
en_PH.utf8
en_SG
en_SG.iso88591
en_SG.utf8
en_US
en_US.iso88591
en_US.iso885915
en_US.utf8
en_ZA
en_ZA.iso88591
en_ZA.utf8
en_ZM
en_ZM.utf8
en_ZW
en_ZW.iso88591
en_ZW.utf8
ru_RU.utf8
[vagrant@localhost ~]$ sudo localectl set-locale LC_TIME=ru_RU.utf8
[vagrant@localhost ~]$ cat /etc/locale.conf
LC_TIME=ru_RU.utf8

[vagrant@localhost ~]$ sudo timedatectl set-timezone Europe/Minsk
[vagrant@localhost ~]$ date
Вт 09 июл 2023 13:00:27 +03    

vagrant@ubuntu-xenial:~$ sudo vi /etc/motd
vagrant@ubuntu-xenial:~$ cat /etc/motd
======================================
       DevOps_Curs_HW01_Ubuntu
======================================

2. Определить точную версию ядра.
  [vagrant@localhost ~]$ uname -rv
3. Вывести список модулей ядра и записать в файл
   [vagrant@localhost ~]$ find /lib/modules/3.10.0-1127.el7.x86_64/kernel -name *.ko* > kernel_module
4. Просмотреть информацию о процессоре и модулях оперативной памяти
[vagrant@localhost ~]$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
stepping        : 10
microcode       : 0xffffffff
cpu MHz         : 2400.004
cache size      : 8192 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc eagerfpu pni pclmulqdq monitor ssse3 cx16 pcid sse4_1 sse4_2 movbe popcnt aes rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single fsgsbase bmi1 bmi2 invpcid rdseed clflushopt md_clear flush_l1d arch_capabilities
bogomips        : 4800.00
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:


[vagrant@localhost ~]$ sudo cat /proc/meminfo
MemTotal:         498684 kB
MemFree:          309368 kB
MemAvailable:     391528 kB
Buffers:            2068 kB
Cached:            76372 kB
SwapCached:            0 kB
Active:            59004 kB
Inactive:          58504 kB
Active(anon):      39276 kB
Inactive(anon):     4360 kB
Active(file):      19728 kB
Inactive(file):    54144 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:       2097148 kB
SwapFree:        2097148 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         39088 kB
Mapped:            23300 kB
Shmem:              4568 kB
Slab:              44020 kB
SReclaimable:      21400 kB
SUnreclaim:        22620 kB
KernelStack:        1632 kB
PageTables:         5032 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     2346488 kB
Committed_AS:     298392 kB
VmallocTotal:   34359738367 kB
VmallocUsed:        5028 kB
VmallocChunk:   34359730176 kB
Percpu:              164 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       38848 kB
DirectMap2M:      485376 kB

5. Получить информацию о жестком диске
[vagrant@localhost ~]$ sudo fdisk -l

Disk /dev/sda: 42.9 GB, 42949672960 bytes, 83886080 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0009ef1a

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048    83886079    41942016   83  Linux
6. Добавить в виртуальную машину второй сетевой интерфейс (вывести информацию о нем в виртуалках)
[vagrant@localhost ~]$ sudo vi  /etc/sysconfig/network-scripts/ifcfg-eth1
[vagrant@localhost ~]$ cat  /etc/sysconfig/network-scripts/ifcfg-eth1
OTPROTO=none
DEVICE=eth1
HWADDR=08:00:27:7F:A3:41
IPADDR=66.77.88.99
MTU=1500
NETMASK=255.255.255.0
ONBOOT=yes
STARTMODE=auto
TYPE=Ethernet

[vagrant@localhost ~]$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 86362sec preferred_lft 86362sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:7f:a3:41 brd ff:ff:ff:ff:ff:ff
    inet 66.77.88.99/24 brd 66.77.88.255 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe7f:a341/64 scope link
       valid_lft forever preferred_lft forever
[vagrant@localhost ~]$
