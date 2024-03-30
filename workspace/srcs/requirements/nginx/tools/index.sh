#!/bin/bash

echo "Hello, World! Nginx container NEW"

echo "pwd: $(pwd) | app-vol: $(ls /app-vol) | volume: $(ls /)"

if [ -f '/app-vol/readme.txt' ]; then
	echo "It's already have a readme.txt here XDsdfsdfsdf"
	cat /app-vol/readme.txt
	echo "Thino is heeere" >> /app-vol/readme.txt
else
	echo "Isn't have a readme.txt here, i'll write one for ü ;)ssdas"
	ls /app-vol
	echo -e "# README.TXT\n\nI'm a readme.txt XD" > /app-vol/readme.txt
fi
