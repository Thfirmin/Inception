#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE_NAME" ]; then
    mysqld_safe --datadir=/var/lib/mysql&
    sleep 1

mysql -e "CREATE DATABASE $MYSQL_DATABASE_NAME;"
mysql -e "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO $MYSQL_USER@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown
fi

exec mysqld_safe --datadir=/var/lib/mysql
