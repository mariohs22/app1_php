FROM php:7.4-apache

RUN apt-get update
# RUN apt-get -y install default-mysql-client
# RUN docker-php-ext-install pdo mysqli pdo_mysql

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Configure apache & enable apache module rewrite
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
    && a2enmod rewrite

# set our application folder as an environment variable
ENV APP_HOME /var/www/html

# change uid and gid of apache to docker user uid/gid
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

#copy source files
COPY app $APP_HOME

# install composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# install all PHP dependencies
# RUN composer install --no-interaction

# change ownership of our applications
RUN chown -R www-data:www-data $APP_HOME

# update apache port at runtime for Heroku
ENTRYPOINT []
COPY run-apache2.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run-apache2.sh
CMD [ "run-apache2.sh" ]
