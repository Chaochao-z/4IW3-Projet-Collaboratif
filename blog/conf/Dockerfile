FROM php:5.6-apache

LABEL Maintainer="Sebastien GAUDARD <sebastien.gaudard.1@gmail.com>"


RUN apt update
RUN apt install ruby ruby-dev rubygems build-essential -y
RUN gem install fpm

RUN docker-php-ext-install mysql mysqli pdo pdo_mysql
## RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

VOLUME /var/www
WORKDIR /var/www

COPY ./blog-default.conf /etc/apache2/sites-available/blog-default.conf
RUN a2ensite blog-default

RUN chown -R www-data:www-data /var/www

COPY ./php.ini /usr/local/etc/php/php.ini

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

EXPOSE 80
