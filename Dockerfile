FROM php:8.2-fpm-alpine

#Install packages
RUN apk add --update --no-cache autoconf g++ imagemagick imagemagick-dev libtool make pcre-dev libzip-dev icu-dev sqlite-dev curl-dev libjpeg-turbo-dev libpng-dev libwebp-dev freetype-dev bash \
    && pecl install imagick \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
    && docker-php-ext-install mysqli pdo pdo_mysql intl zip pdo_sqlite curl opcache gd \
    && docker-php-ext-enable imagick pdo_sqlite opcache

#Install composer
RUN wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

WORKDIR /var/www
