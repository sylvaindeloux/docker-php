FROM php:7-fpm
MAINTAINER Sylvain Deloux <docker@eax.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y libicu-dev libmcrypt-dev libcurl3-dev zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install intl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install opcache
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install curl
RUN docker-php-ext-install zip

RUN usermod -u 1000 www-data
