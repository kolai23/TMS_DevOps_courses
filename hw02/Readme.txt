1. Смонтировать /home на отдельный раздел
Добавил диск на 2 гб 
vagrant@ubuntu-xenial:~$ sudo fdisk -l
Disk /dev/sda: 40 GiB, 42949672960 bytes, 83886080 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xba21720e

Device     Boot Start      End  Sectors Size Id Type
/dev/sda1  *     2048 83886046 83883999  40G 83 Linux


Disk /dev/sdb: 10 MiB, 10485760 bytes, 20480 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdc: 2 GiB, 2147483648 bytes, 4194304 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

vagrant@ubuntu-xenial:~$ sudo mkfs -t ext4 /dev/sdc
vagrant@ubuntu-xenial:~$ sudo cp -a /home/* /mnt/home
vagrant@ubuntu-xenial:~$ sudo mount /dev/sdb1 /home/
vagrant@ubuntu-xenial:~$ sudo cp -a /mnt/home/* /home/
vagrant@ubuntu-xenial:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            488M     0  488M   0% /dev
tmpfs           100M  3.1M   97M   4% /run
/dev/sda1        39G  932M   38G   3% /
tmpfs           497M     0  497M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           497M     0  497M   0% /sys/fs/cgroup
/dev/sdc        2.0G  3.1M  1.8G   1% /home
tmpfs           100M     0  100M   0% /run/user/1000
vagrant@ubuntu-xenial:~$ sudo vi /etc/fstab
.....
/dev/sdc /home ext4 defaults 0 0
2. Создать нового пользователя user_with_group с home-директорией /var/home/user
vagrant@ubuntu-xenial:~$ sudo mkdir -p /var/home/users
vagrant@ubuntu-xenial:~$ sudo cp -rT /etc/skel /var/home/users
vagrant@ubuntu-xenial:~$ sudo useradd -m -d /var/home/users users_with_group
vagrant@ubuntu-xenial:~$ su - users_with_group
Password:
users_with_group@ubuntu-xenial:~$ pwd
/var/home/users
users_with_group@ubuntu-xenial:~$ ls -al
total 20
drwxr-xr-x 2 root root 4096 Jul  9 14:29 .
drwxr-xr-x 4 root root 4096 Jul  9 14:23 ..
-rw-r--r-- 1 root root  220 Jul  9 14:29 .bash_logout
-rw-r--r-- 1 root root 3771 Jul  9 14:29 .bashrc
-rw-r--r-- 1 root root  655 Jul  9 14:29 .profile
3. Создать новую группу пользователей priv_group, перенести в нее пользователя user_with_group
vagrant@ubuntu-xenial:~$ sudo groupadd priv_group
vagrant@ubuntu-xenial:~$ sudo usermod -g priv_group users_with_group
vagrant@ubuntu-xenial:~$ cat /etc/group | grep priv_group
priv_group:x:1004:
vagrant@ubuntu-xenial:~$ cat /etc/passwd | grep 1004
users_with_group:x:1003:1004::/var/home/users:
4. Cоздать директорию и выдать права на нее только группе это пользователя
vagrant@ubuntu-xenial:~$ sudo mkdir -p /mnt/task4_hw2
vagrant@ubuntu-xenial:~$ sudo chown root:priv_group /mnt/task4_hw2/
vagrant@ubuntu-xenial:~$ ls -al /mnt/
total 16
drwxr-xr-x  4 root root       4096 Jul  9 14:59 .
drwxr-xr-x 24 root root       4096 Jul  9 01:52 ..
drwxr-xr-x  4 root root       4096 Jul  8 20:44 home
drwxr-xr-x  2 root priv_group 4096 Jul  9 14:59 task4_hw2
5. Установить ntpd(chrony), разрешить пользователю user_with_group выполнять команду systemctl restart chronyd (нужны права sudo)
vagrant@ubuntu-xenial:~$ sudo apt-get install ntp
vagrant@ubuntu-xenial:~$ sudo visudo -f /etc/sudoers
vagrant@ubuntu-xenial:~$ sudo cat /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
users_with_group   ALL=(ALL) /bin/systemctl restart ntp

# See sudoers(5) for more information on "#include" directives:
vagrant@ubuntu-xenial:~$ su - users_with_group
Password:
users_with_group@ubuntu-xenial:~$ sudo systemctl restart ntp
users_with_group@ubuntu-xenial:~$ systemctl status ntp
● ntp.service - LSB: Start NTP daemon
   Loaded: loaded (/etc/init.d/ntp; bad; vendor preset: enabled)
   Active: active (running) since Sun 2023-07-09 19:51:24 UTC; 2min 48s ago
     Docs: man:systemd-sysv-generator(8)
  Process: 14401 ExecStop=/etc/init.d/ntp stop (code=exited, status=0/SUCCESS)
  Process: 14414 ExecStart=/etc/init.d/ntp start (code=exited, status=0/SUCCESS)
    Tasks: 2
   Memory: 624.0K
      CPU: 81ms
   CGroup: /system.slice/ntp.service
           └─14426 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 112:117

