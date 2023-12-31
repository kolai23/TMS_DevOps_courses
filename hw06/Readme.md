### 1. Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM. Определите класс и адреса подсетей, в которых находится VM.**
```bash
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:5c:f3:75 brd ff:ff:ff:ff:ff:ff
    inet 192.168.5.228/24 metric 100 brd 192.168.5.255 scope global dynamic enp0s3
       valid_lft 3569sec preferred_lft 3569sec
    inet6 fe80::a00:27ff:fe5c:f375/64 scope link
       valid_lft forever preferred_lft forever
```
Мы имеем два интерфейса с ip 127.0.0.1/8 и 192.168.5.228/24
Адрес 127.0.0.1/8 принадлежит зарезервированому диапазону для петлевых интерфейсов. Адрес относится к адресам класса A. Адрес сети 127.0.0.0 диапазон хостов 127.0.0.0 - 127.255.255.254 маска подсети 255.0.0.0
Адрес 192.168.5.228/24 относится к адресам класса С. Адрес входит в диапазон сетей которые IANA выделила для локальных сетей. Адрес сети 192.168.5.0 диапазон хостов 192.168.5.1 - 192.168.5.254 маска подсети 255.255.255.0


### 2. Определить публичный IP адрес хоста и Linux VM? Чем они отличаются?**

- Публичный IP адрес хоста
```bash
  PS C:\Users\vabischevich> (curl -Uri 'https://icanhazip.com' -Credential $cred).Content
  212.98.164.114
```
  
-  Публичный IP адрес Linux VM
```bash
  test@test:~$ curl 'https://icanhazip.com'
  212.98.164.114
```
Отличий в IP адрессах нет как, настроен шлюз через который IP адреса натируются на один публичный адрес.

### 3. Вывести ARP таблицу на хосте и найти там запись, соответствующую MAC адресу с предыдущего задания. Если её нет, то объяснить почему.**
```bash
  C:\Users\vabischevich>arp -a | find "08-00-27-5c-f3-75"
  192.168.5.228         08-00-27-5c-f3-75     динамический
```
### 4. Выполнить разбиение сети 172.20.0.0/16 на подсети с маской /24 и ответить на следующие вопросы:**
- Сколько всего подсетей будет в сети?
    
  256

- Сколько узлов будет в каждой подсети?
  
  254

- Каким будет сетевой адрес первой и второй подсети?

  172.20.0.0
  
  172.20.1.0
  
- Каким будут адреса первого и последнего хостов в первой и второй подсетях?

  172.20.0.1 - 172.20.1.254
  
  172.20.1.1 - 172.20.1.254
  
- Каким будет широковещательный адрес в последней подсети?
  
  172.20.255.255

### 5. Найти IP адрес соответствующий доменному имени ya.ru. Выполнить HTTP запрос на указазнный IP адрес, чтобы скачать страницу с помощью утилиты curl. В результате должна вывестись HTML страничка в консоль. Подсказка: https://stackoverflow.com/questions/46563730/can-i-access-to-website-using-ip-address**
```bash
test@test:~$ nslookup ya.ru
Server:         127.0.0.53
Address:        127.0.0.53#53

Non-authoritative answer:
Name:   ya.ru
Address: 77.88.55.242
Name:   ya.ru
Address: 5.255.255.242
Name:   ya.ru
Address: 2a02:6b8::2:242

test@test:~$
test@test:~$ curl 5.255.255.242 -Lv --header 'Host: ya.ru' >curl_ya_file.txt
test@test:~$
```
