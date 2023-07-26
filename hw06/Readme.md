**1. Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM. Определите класс и адреса подсетей, в которых находится VM.**
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


**2. Определить публичный IP адрес хоста и Linux VM? Чем они отличаются?**

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

**3. Вывести ARP таблицу на хосте и найти там запись, соответствующую MAC адресу с предыдущего задания. Если её нет, то объяснить почему.**
```bash
  C:\Users\vabischevich>arp -a | find "08-00-27-5c-f3-75"
  192.168.5.228         08-00-27-5c-f3-75     динамический
```
**4. Выполнить разбиение сети 172.20.0.0/16 на подсети с маской /24 и ответить на следующие вопросы:**
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

**5. Найти IP адрес соответствующий доменному имени ya.ru. Выполнить HTTP запрос на указазнный IP адрес, чтобы скачать страницу с помощью утилиты curl. В результате должна вывестись HTML страничка в консоль. Подсказка: https://stackoverflow.com/questions/46563730/can-i-access-to-website-using-ip-address**
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

test@test:~$ curl -L http://77.88.55.242 --verbose
*   Trying 77.88.55.242:80...
* Connected to 77.88.55.242 (77.88.55.242) port 80 (#0)
> GET / HTTP/1.1
> Host: 77.88.55.242
> User-Agent: curl/7.81.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 406 Not acceptable
< Accept-CH: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< Connection: Close
< Content-Length: 0
< NEL: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< Report-To: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
< X-Content-Type-Options: nosniff
< X-Yandex-Req-Id: 1690369798587737-7255223784105533405-balancer-l7leveler-kubr-yp-sas-128-BAL
<
* Closing connection 0

test@test:~$ curl -L https://ya.ru --verbose
*   Trying 5.255.255.242:443...
* Connected to ya.ru (5.255.255.242) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: C=RU; ST=Moscow; L=Moscow; O=Yandex LLC; CN=*.xn--d1acpjx3f.xn--p1ai
*  start date: Jun 21 13:42:48 2023 GMT
*  expire date: Dec 19 20:59:59 2023 GMT
*  subjectAltName: host "ya.ru" matched cert's "ya.ru"
*  issuer: C=BE; O=GlobalSign nv-sa; CN=GlobalSign ECC OV SSL CA 2018
*  SSL certificate verify ok.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x5643f85efe90)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET / HTTP/2
> Host: ya.ru
> user-agent: curl/7.81.0
> accept: */*
>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 302
< x-yandex-eu-request: 0
< location: https://ya.ru/showcaptcha?cc=1&mt=0AFB3910E6601058F0E8FC772AE2E7D7B0B3C3C2F0DF5B3D08198EB36947465389F212B44155C7F46116064DFB6001CEA7C73464C0C7338F568A45717536081B9C8B8557EE271CE7DCF95AC498CD3F10B1BB8852BE2C41E6EDA0A65F534E&retpath=aHR0cHM6Ly95YS5ydS8__8826b36660c3826a1376a9595e97ed54&t=2/1690370046/c12698054c40d128e2eaa731a81c2673&u=cbcd70a2-e9cf3b1-e713c946-e0b17697&s=20cfe0a8506d48759320bb2b667a60eb
< nel: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< x-yandex-captcha: captcha
< set-cookie: spravka=dD0xNjU4ODM0MDQ2O2k9MjEyLjk4LjE2NC4xMTQ7RD00REZCMjJGNzc3Q0M2NTk2NDVCRjNBMDI4NjY2OTg2MkFBRDcyMzBBMjM2MjQ5QzA3NTk4M0Y0MDUxMjQxNjE4NkFDQUMyQTA5QUFCO3U9MTY1ODgzNDA0NjQxMDcwODgwMDtoPTdjYmZjNThlYWQyZDA5NzA2YmYwMGU2YWM3MDQ4NDk5; domain=.ya.ru; path=/; expires=Fri, 25 Aug 2023 11:14:06 GMT
< set-cookie: i=1N6jOelvRa+VkSrJwfxkbTc1jX9QEELV2Co9ugujXEc2j0mjPfLsuHGrRcWtexpPEfkbc8WiFy6NBy/gtShjiaSHNps=; Expires=Fri, 25-Jul-2025 11:14:06 GMT; Domain=.ya.ru; Path=/; Secure; HttpOnly
< set-cookie: yandexuid=5395502301690370046; Expires=Fri, 25-Jul-2025 11:14:06 GMT; Domain=.ya.ru; Path=/; Secure
< x-yandex-req-id: 1690370046409219-13371467800039550230-balancer-l7leveler-kubr-yp-vla-59-BAL
< accept-ch: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< report-to: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
<
* Connection #0 to host ya.ru left intact
* Issue another request to this URL: 'https://ya.ru/showcaptcha?cc=1&mt=0AFB3910E6601058F0E8FC772AE2E7D7B0B3C3C2F0DF5B3D08198EB36947465389F212B44155C7F46116064DFB6001CEA7C73464C0C7338F568A45717536081B9C8B8557EE271CE7DCF95AC498CD3F10B1BB8852BE2C41E6EDA0A65F534E&retpath=aHR0cHM6Ly95YS5ydS8__8826b36660c3826a1376a9595e97ed54&t=2/1690370046/c12698054c40d128e2eaa731a81c2673&u=cbcd70a2-e9cf3b1-e713c946-e0b17697&s=20cfe0a8506d48759320bb2b667a60eb'
* Found bundle for host ya.ru: 0x5643f85e8ff0 [can multiplex]
* Re-using existing connection! (#0) with host ya.ru
* Connected to ya.ru (5.255.255.242) port 443 (#0)
* Using Stream ID: 3 (easy handle 0x5643f85efe90)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET /showcaptcha?cc=1&mt=0AFB3910E6601058F0E8FC772AE2E7D7B0B3C3C2F0DF5B3D08198EB36947465389F212B44155C7F46116064DFB6001CEA7C73464C0C7338F568A45717536081B9C8B8557EE271CE7DCF95AC498CD3F10B1BB8852BE2C41E6EDA0A65F534E&retpath=aHR0cHM6Ly95YS5ydS8__8826b36660c3826a1376a9595e97ed54&t=2/1690370046/c12698054c40d128e2eaa731a81c2673&u=cbcd70a2-e9cf3b1-e713c946-e0b17697&s=20cfe0a8506d48759320bb2b667a60eb HTTP/2
> Host: ya.ru
> user-agent: curl/7.81.0
> accept: */*
>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200
< content-length: 12816
< x-yandex-eu-request: 0
< nel: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< x-yandex-captcha: captcha
< set-cookie: i=te0jiliJcczlfwT+JieFN6nUj29OFoVeZlD+JtcGdswA8U9PpLbbL5ejbT/8rv3y8GYoKWhS/cODw+mSJGxZfP+69dk=; Expires=Fri, 25-Jul-2025 11:14:06 GMT; Domain=.ya.ru; Path=/; Secure; HttpOnly
< set-cookie: yandexuid=3270794651690370046; Expires=Fri, 25-Jul-2025 11:14:06 GMT; Domain=.ya.ru; Path=/; Secure
< x-yandex-req-id: 1690370046425634-12532330245827079465-balancer-l7leveler-kubr-yp-vla-59-BAL
< accept-ch: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< report-to: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
< content-type: text/html
<
<!doctype html><html prefix="og: http://ogp.me/ns#"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title data-react-helmet="true">Ой!</title><meta data-react-helmet="true" property="og:title" content="Яндекс"><meta data-react-helmet="true" property="og:description" content="Найдётся всё"><meta data-react-helmet="true" property="og:image" content="https://yastatic.net/s3/home-static/_/37/37a02b5dc7a51abac55d8a5b6c865f0e.png"><link rel="stylesheet" href="/captcha_smart.a737a5c9dbdd19f5b829.min.css?k=1688990308309"><style>@media only screen and (min-width:651px){body{background-image:url('https://captcha-backgrounds.s3.yandex.net/static/default-background.jpg')}}.LogoLink{background-image:url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNzggOTEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbD0ibm9uZSI+PHBhdGggZD0iTTI0OS43ODkgODQuODY4OVY3Mi40MTQ2QzI0NSA3NS42MjQ1IDIzNi45NzYgNzguNDQ5MiAyMjkuNDY5IDc4LjQ0OTJDMjE4LjIxIDc4LjQ0OTIgMjEzLjkzOSA3My4xODUgMjEzLjI5MSA2Mi4zOTk4SDI1MC40MzZWNTQuMzEwOUMyNTAuNDM2IDMxLjg0MTcgMjQwLjQ3MSAyMy4zNjc3IDIyNS4wNjkgMjMuMzY3N0MyMDYuMzAzIDIzLjM2NzcgMTk3LjM3MiAzNy42MTk1IDE5Ny4zNzIgNTcuMTM1NkMxOTcuMzcyIDc5LjYwNDcgMjA4LjUwMyA5MC41MTgzIDIyOC4xNzUgOTAuNTE4M0MyMzguMDExIDkwLjUxODMgMjQ1LjI1OSA4Ny45NTA0IDI0OS43ODkgODQuODY4OVpNMzQ2LjA4MSA5MC41MTgzQzM1My4xOTkgOTAuNTE4MyAzNTguMjQ3IDg5LjIzNDMgMzYyIDg2LjUzOFY3NC4wODM3QzM1OC4xMTcgNzYuNzggMzUzLjQ1OCA3OC40NDkyIDM0Ni45ODcgNzguNDQ5MkMzMzUuOTg2IDc4LjQ0OTIgMzMxLjQ1NiA2OS45NzUxIDMzMS40NTYgNTYuNjIyQzMzMS40NTYgNDIuNjI2OSAzMzcuMDIxIDM1LjQzNjggMzQ3LjExNiAzNS40MzY4QzM1My4wNyAzNS40MzY4IDM1OC44OTQgMzcuNDkxMSAzNjIgMzkuNDE3MVYyNi40NDkyQzM1OC43NjQgMjQuNjUxNiAzNTMuMDcgMjMuMzY3NyAzNDUuNDM0IDIzLjM2NzdDMzI1Ljc2MSAyMy4zNjc3IDMxNS41MzcgMzcuMzYyNyAzMTUuNTM3IDU3LjAwNzJDMzE1LjUzNyA3OC41Nzc2IDMyNS41MDIgOTAuNTE4MyAzNDYuMDgxIDkwLjUxODNaTTEwOC43MTcgMjQuNjUxNlY1MC4yMDIySDg4LjEzODJWMjQuNjUxNkg3Mi43MzY3Vjg5LjIzNDNIODguMTM4MlY2Mi4yNzE0SDEwOC43MTdWODkuMjM0M0gxMjQuMTE4VjI0LjY1MTZIMTA4LjcxN1pNMTkzLjYxOSA3Ny4xNjUySDE4Ni43NTlWMjQuNjUxNkgxNDEuODQ5VjMwLjE3MjZDMTQxLjg0OSA0NS45NjUyIDE0MC44MTQgNjYuMzggMTM1LjM3OCA3Ny4xNjUySDEzMC41ODlWMTA0SDE0NC44MjZWODkuMjM0M0gxNzkuMzgyVjEwNEgxOTMuNjE5Vjc3LjE2NTJaTTI5OC45NyA4OS4yMzQzSDMxNi40NDNMMjkxLjcyMyA1NC40MzkzTDMxMy40NjYgMjQuNjUxNkgyOTcuOTM1TDI3Ni4xOTIgNTQuNDM5M1YyNC42NTE2SDI2MC43OVY4OS4yMzQzSDI3Ni4xOTJWNTcuNTIwOEwyOTguOTcgODkuMjM0M1pNMjI0LjgxIDM1LjQzNjhDMjMyLjQ0NiAzNS40MzY4IDIzNC43NzYgNDEuNzI4MiAyMzQuNzc2IDQ5LjgxNzFWNTEuMTAxSDIxMy4yOTFDMjEzLjY4IDQwLjgyOTQgMjE3LjQzMyAzNS40MzY4IDIyNC44MSAzNS40MzY4Wk0xNzEuMzU4IDc3LjE2NTJIMTQ5LjYxNUMxNTMuODg2IDY3LjQwNzIgMTU1LjA1MSA0OS44MTcxIDE1NS4wNTEgMzguNjQ2N1YzNi43MjA4SDE3MS4zNThWNzcuMTY1MloiIGZpbGw9ImJsYWNrIj48L3BhdGg+CiAgICAgICAgPHBhdGggZD0iTTQ0LjEzMzcgODkuMjM0Nkg1OS43OTRWMEgzNy4wMTUzQzE0LjEwNzIgMCAyLjA3MDc5IDExLjY4NCAyLjA3MDc5IDI4Ljg4ODlDMi4wNzA3OSA0Mi42MjcyIDguNjcxNDMgNTAuNzE2IDIwLjQ0OSA1OS4wNjE3TDAgODkuMjM0NkgxNi45NTQ2TDM5LjczMzMgNTUuNDY2N0wzMS44Mzg0IDUwLjIwMjVDMjIuMjYxIDQzLjc4MjcgMTcuNjAxNyAzOC43NzUzIDE3LjYwMTcgMjcuOTkwMUMxNy42MDE3IDE4LjQ4ODkgMjQuMzMxOCAxMi4wNjkxIDM3LjE0NDggMTIuMDY5MUg0NC4xMzM3Vjg5LjIzNDZaIiBmaWxsPSIjRkMzRjFEIj48L3BhdGg+PC9zdmc+')}</style><div id="root"><div class="Theme Theme_color_yandex-default Theme_root_default"><div class="Container"><div class="Spacer" style="padding-bottom:40px"><a href="https://www.ya.ru" title="Yandex" class="Link Link_view_default LogoLink"></a></div><form method="POST" action="/checkcaptcha?key=3f577cac-b2ecba48-e2b5ce28-f8e2f1bc_2/1690370046/c12698054c40d128e2eaa731a81c2673_dc28b86569ff4a59544d4bec21fc22bc&mt=EA529A3A849F7F18F414A3448DB553D28C5E6B1F265BEEBE799010F67555F4A68747D48E07F79FB200AAF92F058FC4D551A61BCB02057795704E97F4D4F1ED0349E825D368C89C42C1B46E5785A68C199F3356642A2466C9F55CE7F3FAF4&retpath=aHR0cHM6Ly95YS5ydS8__8826b36660c3826a1376a9595e97ed54&u=cbcd70a2-e9cf3b1-e713c946-e0b17697&s=c48eacaabdd48176c769b7e1dba36133" id="checkbox-captcha-form"><div class="Spacer" style="padding-bottom:16px"><span class="Text Text_weight_medium Text_typography_headline-s">Подтвердите, что запросы отправляли вы, а не робот</span></div><div class="Spacer" style="padding-bottom:16px"><span class="Text Text_weight_regular Text_typography_body-long-m">Нам очень жаль, но запросы с вашего устройства похожи на автоматические.   <a href="https://yandex.ru/support/smart-captcha?unique_key=cbcd70a2-e9cf3b1-e713c946-e0b17697" class="Link Link_view_default">Почему это могло произойти?</a></span></div><noscript><span class="Text Text_color_alert Text_weight_medium Text_typography_body-long-m">У вас отключено исполнение JavaScript. По нажатию вы будете направлены на дополнительную проверку. <a href="https://yandex.ru/support/common/browsers-settings/browsers-java-js-settings.html" class="Link Link_view_default">Как включить JavaScript?</a></span></noscript><div class="Spacer Spacer_auto-gap_bottom" style="padding-top:40px;padding-bottom:40px"><div class="CheckboxCaptcha" data-testid="checkbox-captcha"><div class="CheckboxCaptcha-Inner"><div class="CheckboxCaptcha-Anchor"><input type="button" id="js-button" class="CheckboxCaptcha-Button" aria-checked="false" aria-labelledby="smartcaptcha-status" role="checkbox"><noscript><input type="submit" class="CheckboxCaptcha-Button" aria-checked="false" aria-labelledby="smartcaptcha-status" role="checkbox"></noscript><div class="CheckboxCaptcha-Checkbox" data-checked="false"><svg class="SvgIcon" width="24" height="24" viewBox="0 0 24 25" fill="none"><path d="M4 12.5L9.5 18.5L20 6.5" stroke="#000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path></svg></div></div><div class="CheckboxCaptcha-Label"><span class="Text Text_weight_regular Text_typography_control-xxl CheckboxCaptcha-LabelText">Я не робот</span><span class="Text Text_color_control-secondary Text_weight_regular Text_typography_control-l CheckboxCaptcha-SecondaryText">Нажмите, чтобы продолжить</span><span class="Text Text_color_ghost Text_weight_regular Text_typography_control-s CheckboxCaptcha-Links"><a target="_blank" href="https://cloud.yandex.ru/services/smartcaptcha" aria-describedby="service-link-description" class="Link Link_view_captcha">Yandex SmartCaptcha</a><span class="Links-Dot">•</span><a target="_blank" href="https://yandex.ru/legal/smartcaptcha_notice/" aria-describedby="connect-link-description" class="Link Link_view_captcha">Обработка данных</a><div class="visuallyhidden" id="service-link-description">connect-link-description</div><div class="visuallyhidden" id="privacy-link-description">Сайт с информацией об обработке данных</div></span></div><div class="CheckboxCaptcha-Icon"><svg width="41" height="20" viewBox="0 0 41 20" fill="none" class="CloudIcon"><path d="M10.251 11.0479C10.7785 12.2034 10.9542 12.6053 10.9542 13.9932V15.8333H9.07031V12.7309L5.51562 5H7.48142L10.251 11.0479ZM12.5746 5L10.2698 10.2376H12.1852L14.4963 5H12.5746Z" fill="#000"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 18.2292C14.5448 18.2292 18.2292 14.5448 18.2292 10C18.2292 5.45516 14.5448 1.77083 10 1.77083C5.45516 1.77083 1.77083 5.45516 1.77083 10C1.77083 14.5448 5.45516 18.2292 10 18.2292ZM10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20Z" fill="#000"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M39.2333 10C39.2333 14.55 35.55 18.2333 31 18.2333C29.8094 18.2333 28.9202 17.7864 28.4755 17.2443C28.0308 16.7022 27.9057 15.8152 28.0588 14.5339L30.7088 14.0082C33.13 13.5647 34.4641 12.2176 34.9417 9.80288C35.0001 9.46485 35.0669 9.12682 35.1301 8.8064C35.156 8.67525 35.1813 8.54705 35.2052 8.42301C35.2774 8.03104 35.3471 7.65855 35.411 7.31691C35.4783 6.95699 35.5392 6.63132 35.5899 6.3532C35.861 4.78329 35.6407 3.62423 35.0309 2.81788C37.5398 4.22801 39.2333 6.91477 39.2333 10ZM31 1.76667C26.45 1.76667 22.7667 5.45 22.7667 10C22.7667 13.0852 24.4602 15.772 26.9691 17.1821C26.3593 16.3758 26.139 15.2167 26.4101 13.6468C26.4684 13.3273 26.538 12.9507 26.6158 12.5305C26.67 12.2378 26.7281 11.9239 26.7889 11.5934C26.8128 11.4694 26.8381 11.3412 26.864 11.21C26.9273 10.8896 26.994 10.5516 27.0524 10.2136C27.5136 7.78235 28.8477 6.43534 31.2688 5.99181L33.9412 5.46614C34.0943 4.18484 33.9692 3.29778 33.5245 2.75569C33.0798 2.2136 32.1906 1.76667 31 1.76667ZM41 10C41 15.5167 36.5167 20 31 20C25.4833 20 21 15.5167 21 10C21 4.48333 25.4833 0 31 0C36.5167 0 41 4.48333 41 10ZM33.6241 7.30597L31.6147 7.70022C29.9018 8.02876 29.1112 8.81726 28.7818 10.5257C28.7052 10.9076 28.6385 11.2698 28.5741 11.6199C28.5554 11.7215 28.5368 11.8222 28.5183 11.922C28.4689 12.1848 28.4195 12.4476 28.3701 12.694L30.363 12.2998C32.0759 11.9712 32.883 11.1827 33.2124 9.47434C33.2848 9.11359 33.3515 8.75192 33.4182 8.39024C33.485 8.02852 33.5517 7.6668 33.6241 7.30597Z" fill="#000"></path></svg></div><div class="CheckboxCaptcha-Alert"></div><div id="smartcaptcha-status" class="CheckboxCaptcha-Status visuallyhidden">SmartCaptcha нужна проверка пользователя</div></div></div></div><span class="Text Text_color_ghost Text_weight_regular Text_typography_control-xs">Если у вас возникли проблемы, пожалуйста, воспользуйтесь <a href="https://yandex.ru/support/smart-captcha?unique_key=cbcd70a2-e9cf3b1-e713c946-e0b17697#help" class="Link Link_view_default">формой обратной связи</a></span><input type="hidden" name="rdata"><input type="hidden" name="aesKey"><input type="hidden" name="signKey"><input type="hidden" name="pdata"><input type="hidden" name="tdata"></form></div></div></div><script>const button=document.getElementById("js-button");button.addEventListener("click",function n(t){window.__JS_BUTTON_CLICKED__=!0,this.removeEventListener("click",n,!1)},!1),window.onerror=function(n,t){0===t.indexOf(window.location.origin+"/captcha_smart.a737a5c9dbdd19f5b829.min.js")&&(button.type="submit",window.Ya&&window.Ya.Rum&&window.Ya.Rum.logEventString&&window.Ya.Rum.logEventString("js_fail_force_submit_type",n,{page:"checkbox"}))}</script> <script>window.__SSR_DATA__={url:"/ru/checkbox",invalid:"no",formAction:"/checkcaptcha?key=3f577cac-b2ecba48-e2b5ce28-f8e2f1bc_2/1690370046/c12698054c40d128e2eaa731a81c2673_dc28b86569ff4a59544d4bec21fc22bc&mt=EA529A3A849F7F18F414A3448DB553D28C5E6B1F265BEEBE799010F67555F4A68747D48E07F79FB200AAF92F058FC4D551A61BCB02057795704E97F4D4F1ED0349E825D368C89C42C1B46E5785A68C199F3356642A2466C9F55CE7F3FAF4&retpath=aHR0cHM6Ly95YS5ydS8__8826b36660c3826a1376a9595e97ed54&u=cbcd70a2-e9cf3b1-e713c946-e0b17697&s=c48eacaabdd48176c769b7e1dba36133",captchaKey:"3f577cac-b2ecba48-e2b5ce28-f8e2f1bc_2/1690370046/c12698054c40d128e2eaa731a81c2673_dc28b86569ff4a59544d4bec21fc22bc",imageSrc:"",taskImageSrc:"",voiceSrc:"",introSrc:"",aesKey:"896lJLG+XEi3UwmC5NHEog+fkCDdmf+mLQnpPaPwMJ8=",aesSign:"1_1690370046_13959937184271527115_338d4297ac8704e02919c57e7a29cb70",reqId:"1690370046425634-12532330245827079465-balancer-l7leveler-kubr-yp-vla-59-BAL",uniqueKey:"cbcd70a2-e9cf3b1-e713c946-e0b17697",powPrefix:"743D313639303337303034363B703D38306638646562612D38656436353661362D31646662623562352D61623632653665653B633D31353B643D39383736454243354534333139323033453735444330384241304639453830453B",powComplexity:"15"}</script><script src="/captcha_smart_error.a737a5c9dbdd19f5b829.min.js?k=1688990308309" crossorigin=""></script><script src="https://yastatic.net/react/16.8.4/react-with-dom-and-polyfills.min.js" crossorigin=""></script><script src="/captcha_smart.a737a5c9dbdd19f5b829.min.js?k=1688990308309" crossorigin=""></script><script>!function(e,n,t,a,c){e.ym=e.ym||function(){(e.ym.a=e.ym.a||[]).push(arguments)},e.ym.l=+new Date,a=n.createElement(t),c=n.getElementsByTagName(t)[0],a.async=1,a.src="https://mc.yandex.ru/metrika/tag.js",c.parentNode.insertBefore(a,c)}(window,document,"script"),ym(10630330,"init",{clickmap:!0,trackLinks:!0,accurateTrackBounce:!0,webvisor:!0,ut:"* Connection #0 to host ya.ru left intact
noindex",params:{req_id:"1690370046425634-12532330245827079465-balancer-l7leveler-kubr-yp-vla-59-BAL",unique_key:"cbcd70a2-e9cf3b1-e713c946-e0b17697"}})</script><noscript><div><img src="https://mc.yandex.ru/watch/10630330?ut=noindex" style="position:absolute;left:-9999px" alt=""></div></noscript><div><img src="https://adfstat.yandex.ru/captcha?req_id=1690370046425634-12532330245827079465-balancer-l7leveler-kubr-yp-vla-59-BAL&unique_key=cbcd70a2-e9cf3b1-e713c946-e0b17697" style="position:absolute;left:-9999px" alt=""></div>
```

