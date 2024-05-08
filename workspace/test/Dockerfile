FROM debian:bullseye

EXPOSE 80

EXPOSE 443

WORKDIR /app

COPY tools/wordpress.tar.gz ./

RUN apt update && apt install -y vim curl nginx php-fpm bat exa

ENTRYPOINT ["/bin/bash"]
