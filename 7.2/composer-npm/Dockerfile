FROM lordofthebrain/php7.2-composer:buster
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  && npm config set cache /var/www/html --global
