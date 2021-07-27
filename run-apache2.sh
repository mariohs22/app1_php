#!/usr/bin/env bash

# apache2-foreground "$@"
# Fixes Heroku apache2 "more than one MPM loaded" error
a2dismod mpm_event

# Change listening port to $PORT
sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf
/usr/local/bin/docker-php-entrypoint apache2-foreground