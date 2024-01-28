FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    git\
    unzip \
    apache2 \ 
    apache2-utils \
    libapache2-mod-php \
    mysql-server \
    python3-pip \ 
    python3-pymysql \
    php \
    php-mysql \
    php-curl \
    php-xml 

WORKDIR /var/www/html

RUN git clone https://github.com/qyjohn/simple-lamp \
    && /etc/init.d/mysql start \
    && mysql -uroot -proot -e "CREATE DATABASE simple_lamp;" \
    && mysql -uroot -proot -e "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';" \
    && mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON simple_lamp.* TO 'username'@'localhost';" \
    && mysql -uroot -proot simple_lamp < /var/www/html/simple-lamp/simple_lamp.sql \
    && sed -i -e 's/dns-or-ip-of-memcached-server/localhost/' /var/www/html/simple-lamp/config.php \
    && chmod -R 777 /var/www/html/simple-lamp/

EXPOSE 80

ENTRYPOINT ["/lib/systemd/systemd"]