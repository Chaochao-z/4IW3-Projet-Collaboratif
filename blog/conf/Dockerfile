FROM php:5.6-apache

LABEL Maintainer="Sebastien GAUDARD <sebastien.gaudard.1@gmail.com>"


RUN apt update
RUN apt install ruby ruby-dev rubygems build-essential -y
RUN gem install fpm


#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#RUN php composer-setup.php
#RUN php -r "unlink('composer-setup.php');"
#RUN mv composer.phar /usr/local/bin/composer

COPY --from=composer /usr/bin/composer /usr/bin/composer

VOLUME /var/www
WORKDIR /var/www

COPY ./blog-default.conf /etc/apache2/sites-available/blog-default.conf
RUN a2ensite blog-default

RUN chown -R www-data:www-data /var/www

COPY ./php.ini /usr/local/etc/php/php.ini

EXPOSE 80
