#!bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo UTC > /etc/timezone

sudo systemctl stop apache2
sudo systemctl disable apache2

sudo apt-get update \
    && apt-get install -y gnupg gosu curl ca-certificates zip unzip git supervisor libcap2-bin libpng-dev python3 apt-transport-https software-properties-common \
    && add-apt-repository --yes ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php8.1-cli php8.1-dev php8.1-fpm \
       php8.1-gd \
       php8.1-curl php8.1-memcached \
       php8.1-imap php8.1-mysql php1.0-mbstring \
       php8.1-xml php8.1-zip php8.1-bcmath php8.1-soap \
       php8.1-intl php8.1-readline \
       php8.1-msgpack php8.1-igbinary php8.1-ldap \
       php8.1-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_19.x | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && apt-get install -y mysql-server \
    && apt-get install -y nginx \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
