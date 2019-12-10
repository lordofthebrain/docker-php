FROM php:7.4-fpm-buster
COPY composer-installer.sh  /opt/
RUN apt-get update && apt-get install -y libjpeg62-turbo-dev libfreetype6-dev libpng-dev libzip-dev net-tools zip libonig-dev \
  && sh /opt/composer-installer.sh \
  && docker-php-ext-configure gd \
  && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
  && docker-php-ext-install -j${NPROC} gd \
  && docker-php-ext-install -j5 mbstring mysqli pdo pdo_mysql shmop zip \
  && apt-get remove --purge -y libfreetype6-dev libpng-dev libjpeg62-turbo-dev libzip-dev \
  && chsh -s /bin/bash www-data
