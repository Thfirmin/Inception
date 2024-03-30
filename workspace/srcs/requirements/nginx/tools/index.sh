#!/bin/bash

echo "Hello, World! Nginx container NEW"

if [ -f '/app-vol/readme.txt' ]; then
	echo "It's already have a readme.txt here XD"
	cat /app-vol/readme.txt
else
	echo "Isn't have a readme.txt here, i'll write one for ü ;)"
	echo -e "# README.TXT\n\nI'm a readme.txt XD" > /app-vol/readme.txt
fi
