#!/bin/bash


tar -xf wordpress.tar.gz --strip-components=1 -C /var/www/wp/
chmod -R 777 /var/www/wp

mv php-pool.conf /etc/php/7.4/fpm/pool.d/www.conf
mkdir /run/php/
chown www-data:www-data /run/php/

exec php-fpm7.4 -F
