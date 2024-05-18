FROM	debian:bullseye

RUN	apt-get update && apt-get install -y nginx openssl

COPY	./conf/nginx.conf /etc/nginx/nginx.conf
COPY	./conf/default.conf /etc/nginx/conf.d/default.conf

COPY	./tools/nginx-cert.sh .

RUN	chown -R www-data:www-data /var/www/*
RUN	chmod -R 777 /var/www/*

RUN	chmod +x ./nginx-cert.sh

RUN	./nginx-cert.sh

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
