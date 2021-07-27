#!/usr/bin/env bash

# sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf
# apache2-foreground "$@"
a2dismod mpm_event
sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf
/usr/local/bin/docker-php-entrypoint apache2-foreground