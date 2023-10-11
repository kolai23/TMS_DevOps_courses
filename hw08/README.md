### 1. Вывести в консоль список всех пользователей системы.
```bash
test@test:~$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
systemd-network:x:101:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:102:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:103:104::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:104:105:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
pollinate:x:105:1::/var/cache/pollinate:/bin/false
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
syslog:x:107:113::/home/syslog:/usr/sbin/nologin
uuidd:x:108:114::/run/uuidd:/usr/sbin/nologin
tcpdump:x:109:115::/nonexistent:/usr/sbin/nologin
tss:x:110:116:TPM software stack,,,:/var/lib/tpm:/bin/false
landscape:x:111:117::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:118:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
usbmux:x:113:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
test:x:1000:1000:test`:/home/test:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
telnetd:x:114:119::/nonexistent:/usr/sbin/nologin
test@test:~$

```
### 2. Найти и вывести в консоль домашние каталоги для текущего пользователя и root.
```bash
test@test:~$ sudo ls -al /root/
[sudo] password for test:
total 28
drwx------  4 root root 4096 Jul 31 07:35 .
drwxr-xr-x 19 root root 4096 Jul 24 07:07 ..
-rw-r--r--  1 root root 3106 Oct 15  2021 .bashrc
-rw-------  1 root root   20 Jul 31 07:35 .lesshst
-rw-r--r--  1 root root  161 Jul  9  2019 .profile
drwx------  3 root root 4096 Jul 24 07:09 snap
drwx------  2 root root 4096 Jul 24 07:09 .ssh
test@test:~$


```
### 3. Создать Bash скрипт get-date.sh, выводящий текущую дату.
```bash
test@test:~$ echo 'echo $(date)' > get-date.sh
test@test:~$ bash get-date.sh
Thu Aug 3 11:58:09 AM UTC 2023
test@test:~$

```
### 4. Запустить скрипт через ./get-date.sh и bash get-date.sh. Какой вариант не работает? Сделать так, чтобы оба варианта работали.
```bash
test@test:~$ ./get-date.sh
-bash: ./get-date.sh: Permission denied
test@test:~$ bash get-date.sh
Thu Aug 3 11:58:50 AM UTC 2023
test@test:~$
test@test:~$ chmod u+x get-date.sh
test@test:~$ ./get-date.sh
Thu Aug 3 12:09:15 PM UTC 2023

```
Для запуска скрипта в виде ./get-date.sh требуюся права на выполнение

### 5. Создать пользователей alice и bob с домашними директориями и установить /bin/bash в качестве командной оболочки по умолчанию.
```bash
test@test:~$ sudo useradd -m -s /bin/bash alice
test@test:~$ sudo useradd -m -s /bin/bash bob
test@test:~$ cat /etc/passwd | grep -P 'alice|bob'
alice:x:1001:1001::/home/alice:/bin/bash
bob:x:1002:1002::/home/bob:/bin/bash

```
### 6. Запустить интерактивную сессию от пользователя alice. Создать файл secret.txt с каким-нибудь секретом в домашней директории при помощи текстового редактора nano.
```bash
test@test:~$ sudo -iu alice
alice@test:~$ nano secret.txt
alice@test:~$ cat secret.txt
Secret task 6
```
### 7. Вывести права доступа к файлу secret.txt.
```bash
alice@test:~$ ls -la secret.txt
-rw-rw-r-- 1 alice alice 15 Aug  3 12:27 secret.txt
```
### 8. Выйти из сессии от alice и открыть сессию от bob. Вывести содержимое файла /home/alice/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.
```bash
bob@test:~$ cat /home/alice/secret.txt
cat: /home/alice/secret.txt: Permission denied
```
Доступ к файлу ограничен для всех пользователей котоме alice и суперпользователей, а так же пользователь Alice не состоит в групе Bob.

### 9. Создать файл secret.txt с каким-нибудь секретом в каталоге /tmp при помощи текстового редактора nano.
```bash
bob@test:~$ nano /tmp/secret.txt
bob@test:~$ cat /tmp/secret.txt
Secret task 9
```
### 10. Вывести права доступа к файлу secret.txt. Поменять права таким образом, чтобы этот файл могли читать только владелец и члены группы, привязанной к файлу.
```bash
ls -al /tmp/secret.txt
-r--r----- 1 bob bob 14 Aug  3 12:35 /tmp/secret.txt

```
### 11. Выйти из сессии от bob и открыть сессию от alice. Вывести содержимое файла /tmp/secret.txt созданного ранее не прибегая к команде sudo.
```bash
alice@test:~$ cat /tmp/secret.txt
cat: /tmp/secret.txt: Permission denied
```
Доступ к файлу ограничен для всех пользователей котоме alice и суперпользователей, а так же пользователь Alice не состоит в групе Bob.

### 12. Добавить пользователя alice в группу, привязанную к файлу /tmp/secret.txt.
```bash
test@test:~$ sudo gpasswd -a alice bob
Adding user alice to group bob
test@test:~$ groups alice
alice : alice bob

```
### 13. Вывести содержимое файла /tmp/secret.txt.
```bash
test@test:~$ sudo -iu alice
alice@test:~$ cat /home/bob/secret.txt
Secret Bob file


```
### 14. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice с помощью rsync.
```bash
test@test:~$ sudo rsync -rv /home/alice/ /tmp/alice/
sending incremental file list
created directory /tmp/alice
./
.bash_logout
.bashrc
.profile
secret.txt

sent 4,934 bytes  received 128 bytes  10,124.00 bytes/sec
total size is 4,646  speedup is 0.92

```
### 15. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice на другую VM по SSH с помощью rsync. Как альтернатива, можно скопировать любую папку с хоста на VM по SSH.
```bash
test@test:~$ sudo rsync -rv /home/alice test@172.27.79.251:/tmp/
test@172.27.79.251's password:
sending incremental file list
alice/
alice/.bash_history
alice/.bash_logout
alice/.bashrc
alice/.profile
alice/secret.txt

sent 5,105 bytes  received 115 bytes  1,491.43 bytes/sec
total size is 4,726  speedup is 0.91

test@test: /tmp$ ll
total 24
drwxrwxrwt  7 root root 4096 Aug 10 12:35 ./
drwxr-xr-x 19 root root 4096 Aug  9 22:25 ../
drwxrwxrwx  2 root root   60 Aug  9 22:25 .X11-unix/
drwxr-xr-x  2 test test 4096 Aug 10 12:35 alice/
drwx------  2 root root 4096 Aug  9 22:25 snap-private-tmp/
drwx------  3 root root 4096 Aug  9 22:25 systemd-private-51bd90358deb4edca90cab74771f3993-systemd-logind.service-68ytkG/
drwx------  3 root root 4096 Aug  9 22:25 systemd-private-51bd90358deb4edca90cab74771f3993-systemd-resolved.service-U8wcMF/

```
### 16. Удалить пользователей alice и bob вместе с домашними директориями.
```bash
test@test:~$ sudo userdel -r alice
test@test:~$ sudo userdel -r bob

```
### 17. С помощью утилиты htop определить какой процесс потребляет больше всего ресурсов в системе.
```bash
htop -s [параметр] - сортировка по параметру. Для выяснения найболее ресурсо потребряемых процеcсов по параметрам (cpu,mem).

```
### 18. Вывести логи сервиса Firewall с помощью journalctl не прибегая к фильтрации с помощью grep.
```bash
test@test:~$ sudo journalctl -u ufw
-- Logs begin at Wed 2023-08-09 21:30:51 UTC, end at Thu 2023-08-10 11:29:50 UTC. --
Aug 09 21:30:51 ubuntu-xenial systemd[1]: Started Uncomplicated firewall.

```
