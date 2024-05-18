#!/bin/sh

if [ ! -f /etc/ssl/inceptionss.crt ] || [ ! -f /etc/ssl/inceptionss.key ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/inceptionss.key -out /etc/ssl/inceptionss.crt -batch
fi
