#!/bin/sh

sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/" /etc/mysql/init.sql
sed -i "s/\${MYSQL_DATABASE}/${MYSQL_DATABASE}/" /etc/mysql/init.sql
sed -i "s/\${MYSQL_USER}/${MYSQL_USER}/" /etc/mysql/init.sql
sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/" /etc/mysql/init.sql
