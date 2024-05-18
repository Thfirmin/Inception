#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
echo "switch to /var/www/html"
cd /var/www/html

echo "Installing and starting WordPress"
		wget -q -O - https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html --strip-components=1
		chmod -R +rwx /var/www/html

		wp --path=/var/www/html --allow-root config create --dbname="$MYSQL_DATABASE_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="mariadb":"3306" --dbprefix='wp_'
		wp --path=/var/www/html --allow-root core install --url="$WP_DOMAIN" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
		wp --path=/var/www/html --allow-root user create "$WP_USER_EDITOR" "$WP_EMAIL_EDITOR" --role='editor' --user_pass="$WP_PASSWORD_EDITOR"
		wp --path=/var/www/html --allow-root user create "$WP_USER" "$WP_EMAIL" --role='subscriber' --user_pass="$WP_PASSWORD"

fi

chmod -R 777 /var/www/html
mkdir -p /run/php/
chown www-data:www-data /run/php/

exec php-fpm7.4 -F
