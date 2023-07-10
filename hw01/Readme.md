1. Произвести минимальную настройку (время, локаль, custom motd)
   timedatectl set-time '2023-06-27 21:55:00'
   sudo timedatectl set-timezone Europe/Minsk
   Вт 27 июн 2023 22:29:27 +03
   lrwxrwxrwx 1 root root 32 июн 26 23:40 /etc/localtime -> /usr/share/zoneinfo/Europe/Minsk
   [vagrant@localhost ~]$ sudo vi /etc/motd
   [vagrant@localhost ~]$ sudo cat /etc/motd
   ======================================
           DevOps_Curs_HW01_Centos7
   ======================================
   sudo update-locale LANG=en_US.UTF-8 LC_TIME=ru_RU.UTF-8
    LANG=en_US.UTF-8
    LANGUAGE=
    LC_CTYPE="en_US.UTF-8"
    LC_NUMERIC="en_US.UTF-8"
    LC_TIME=ru_RU.UTF-8
    LC_COLLATE="en_US.UTF-8"
    LC_MONETARY="en_US.UTF-8"
    LC_MESSAGES="en_US.UTF-8"
    LC_PAPER="en_US.UTF-8"
    LC_NAME="en_US.UTF-8"
    LC_ADDRESS="en_US.UTF-8"
    LC_TELEPHONE="en_US.UTF-8"
    LC_MEASUREMENT="en_US.UTF-8"
    LC_IDENTIFICATION="en_US.UTF-8"
    LC_ALL=
   
3. Определить точную версию ядра.
  uname -rv
  5.15.0-75-generic #82-Ubuntu SMP Tue Jun 6 23:10:23 UTC 2023
   
4. Вывести список модулей ядра и записать в файл
  
5. Просмотреть информацию о процессоре и модулях оперативной памяти
cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
stepping	: 10
microcode	: 0xffffffff
cpu MHz		: 2400.006
cache size	: 8192 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti ssbd ibrs ibpb stibp fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 xsaves flush_l1d arch_capabilities
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data retbleed
bogomips	: 4800.01
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
stepping	: 10
microcode	: 0xffffffff
cpu MHz		: 2400.006
cache size	: 8192 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti ssbd ibrs ibpb stibp fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 xsaves flush_l1d arch_capabilities
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data retbleed
bogomips	: 4800.01
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
stepping	: 10
microcode	: 0xffffffff
cpu MHz		: 2400.006
cache size	: 8192 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti ssbd ibrs ibpb stibp fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 xsaves flush_l1d arch_capabilities
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data retbleed
bogomips	: 4800.01
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
stepping	: 10
microcode	: 0xffffffff
cpu MHz		: 3956.031
cache size	: 8192 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti ssbd ibrs ibpb stibp fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 xsaves flush_l1d arch_capabilities
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data retbleed
bogomips	: 4800.01
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

cat /proc/meminfo
MemTotal:         819776 kB
MemFree:          111868 kB
MemAvailable:     422356 kB
Buffers:           26416 kB
Cached:           393076 kB
SwapCached:         1536 kB
Active:           261788 kB
Inactive:         231072 kB
Active(anon):      10000 kB
Inactive(anon):    65004 kB
Active(file):     251788 kB
Inactive(file):   166068 kB
Unevictable:       30904 kB
Mlocked:           27832 kB
SwapTotal:       2097148 kB
SwapFree:        2071148 kB
Dirty:                24 kB
Writeback:             0 kB
AnonPages:        103652 kB
Mapped:            55064 kB
Shmem:              4060 kB
KReclaimable:      47184 kB
Slab:              92912 kB
SReclaimable:      47184 kB
SUnreclaim:        45728 kB
KernelStack:        2816 kB
PageTables:         2888 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     2507036 kB
Committed_AS:     585384 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       35204 kB
VmallocChunk:          0 kB
Percpu:             2416 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      313280 kB
DirectMap2M:     1783808 kB
DirectMap1G:           0 kB

6. Получить информацию о жестком диске
    sudo fdisk -l
    Disk /dev/loop0: 63.28 MiB, 66355200 bytes, 129600 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/loop1: 111.95 MiB, 117387264 bytes, 229272 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/loop2: 49.84 MiB, 52260864 bytes, 102072 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/loop3: 53.26 MiB, 55844864 bytes, 109072 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/loop4: 63.45 MiB, 66527232 bytes, 129936 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/sda: 127 GiB, 136365211648 bytes, 266338304 sectors
    Disk model: Virtual Disk    
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes
    Disklabel type: gpt
    Disk identifier: FB8FD6CE-9D22-4BDD-8EAB-7D528D032FCD
    
    Device       Start       End   Sectors  Size Type
    /dev/sda1     2048      4095      2048    1M BIOS boot
    /dev/sda2     4096   4198399   4194304    2G Linux filesystem
    /dev/sda3  4198400 266336255 262137856  125G Linux filesystem
    
    
    Disk /dev/mapper/ubuntu--vg-ubuntu--lv: 62.5 GiB, 67104669696 bytes, 131063808 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes

8. Добавить в виртуальную машину второй сетевой интерфейс (вывести информацию о нем в виртуалках)

9. Узнать полную информацию об использованной и неиспользованной памяти

10. Создать пользователя new_admin_user, Настроить ssh доступ пользователю по ключу на VM, запретить ему авторизацию по паролю

11. Вывести список файловых систем, которые поддерживаются ядром
сat /proc/filesystems
nodev	sysfs
nodev	tmpfs
nodev	bdev
nodev	proc
nodev	cgroup
nodev	cgroup2
nodev	cpuset
nodev	devtmpfs
nodev	configfs
nodev	debugfs
nodev	tracefs
nodev	securityfs
nodev	sockfs
nodev	bpf
nodev	pipefs
nodev	ramfs
nodev	hugetlbfs
nodev	devpts
	ext3
	ext2
	ext4
	squashfs
	vfat
nodev	ecryptfs
	fuseblk
nodev	fuse
nodev	fusectl
nodev	mqueue
nodev	pstore
	btrfs
nodev	autofs
nodev	binfmt_misc
