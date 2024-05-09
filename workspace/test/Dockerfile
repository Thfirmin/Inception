FROM debian:bullseye

EXPOSE 80

EXPOSE 443

WORKDIR /app

#COPY tools/wordpress.tar.gz ./

COPY tools/ ./

RUN apt update && apt install -y vim curl nginx php-fpm bat exa

RUN chown -R www-data:www-data /var/www/*

RUN chmod -R 777 /var/www/*

ENTRYPOINT ["/bin/bash"]
