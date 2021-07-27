FROM php:8.0.8-apache

RUN apt-get update
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo mysqli pdo_mysql

COPY index.html info.php /var/www/html/

RUN chmod 755 /var/www/html/*
WORKDIR /var/www/html

#EXPOSE 80 3306
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground
