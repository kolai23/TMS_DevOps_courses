### 1. Распределить основные сетевые протоколы (перечислены ниже) по уровням модели TCP/IP
```bash
UDP Транспортный
TCP Транспортный
FTP Прикладной
RTP Прикладной
DNS Прикладной
ICMP Сетевой
HTTP Прикладной
NTP Прикладной
SSH Прикладной
```

### 2. Узнать pid процесса и длительность подключения ssh с помощью утилиты ss
```bash
test@test:~$ sudo ss -atop | grep ESTAB
[sudo] password for test:
ESTAB  0      48     192.168.5.228:ssh    192.168.5.243:57583 users:(("sshd",pid=4662,fd=4),("sshd",pid=4586,fd=4)) timer:(on,204ms,0)
ESTAB  0      0      192.168.5.228:ssh    192.168.5.243:56197 users:(("sshd",pid=2370,fd=4),("sshd",pid=2313,fd=4)) timer:(keepalive,82min,0)
ESTAB  0      0      192.168.5.228:ssh    192.168.5.243:57586 users:(("sshd",pid=4712,fd=4),("sshd",pid=4588,fd=4)) timer:(keepalive,99min,0)
```


### 3. Закрыть все порты для входящих подключений, кроме ssh
```bash
test@test:~$ sudo iptables -P INPUT DROP
test@test:~$ sudo iptables -A INPUT -m tcp --dports 22 -s 192.168.5.243 -j ACCEPT
```

### 4. Выполнить разбиение сети 172.20.0.0/16 на подсети с маской /24 и ответить на следующие вопросы:
```bash
test@test:~$ sudo tcpdump -A -i enp0s3 -v dst 192.168.5.243 and port telnet   
E..2.4@.@..Y.............^X..^.=P....L..Password:
08:41:44.131256 IP (tos 0x10, ttl 64, id 54325, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa009), ack 86, win 502, length 0
E..(.5@.@..b.............^X..^.@P....B..
08:41:45.456365 IP (tos 0x10, ttl 64, id 54326, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa008), ack 87, win 502, length 0
E..(.6@.@..a.............^X..^.AP....B..
08:41:45.568624 IP (tos 0x10, ttl 64, id 54327, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa007), ack 88, win 502, length 0
E..(.7@.@..`.............^X..^.BP....B..
08:41:45.824524 IP (tos 0x10, ttl 64, id 54328, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa006), ack 89, win 502, length 0
E..(.8@.@.._.............^X..^.CP....B..
08:41:46.000291 IP (tos 0x10, ttl 64, id 54329, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa005), ack 90, win 502, length 0
E..(.9@.@..^.............^X..^.DP....B..
08:41:46.288357 IP (tos 0x10, ttl 64, id 54330, offset 0, flags [DF], proto TCP (6), length 40)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [.], cksum 0x8d42 (incorrect -> 0xa003), ack 92, win 502, length 0
E..(.:@.@..].............^X..^.FP....B..
08:41:46.291666 IP (tos 0x10, ttl 64, id 54331, offset 0, flags [DF], proto TCP (6), length 42)
    143a.capital.local.telnet > by-115.capital.local.56275: Flags [P.], cksum 0x8d44 (incorrect -> 0x92ef), seq 56:58, ack 92, win 502, length 2
E..*.;@.@..Z.............^X..^.FP....D..
```