#!/bin/bash

chown -R mysql:mysql ${DB_VOLUME_PATH}
chmod -R 777 ${DB_VOLUME_PATH}

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

kill  $(cat /var/run/mysqld/mysqld.pid)

mariadbd
