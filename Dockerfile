FROM php:7.4-apache

RUN apt-get update
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo mysqli pdo_mysql

# COPY index.html info.php /var/www/html/

# RUN chmod 755 /var/www/html/*
# WORKDIR /var/www/html

# #EXPOSE 80 3306
# CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground

#install composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

#set our application folder as an environment variable
ENV APP_HOME /var/www/html

#change uid and gid of apache to docker user uid/gid
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

#change the web_root to laravel /var/www/html/public folder
#RUN sed -i -e "s/html/html\/public/g" /etc/apache2/sites-enabled/000-default.conf

# enable apache module rewrite
RUN a2enmod rewrite

#copy source files and run composer
COPY . $APP_HOME

# install all PHP dependencies
#RUN composer install --no-interaction

#change ownership of our applications
RUN chown -R www-data:www-data $APP_HOME

#update apache port at runtime for Heroku
ENTRYPOINT []
#CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground
CMD sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf /etc/apache2/apache2.conf \ 
    sed -i "s/VirtualHost \*:80/VirtualHost \*:${PORT:-80}/g" /etc/apache2/sites-available/000-default.conf