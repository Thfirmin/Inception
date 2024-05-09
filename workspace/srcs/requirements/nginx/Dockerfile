# Use an existing image as base
FROM	debian:bullseye

# Define starter directory
#WORKDIR /app

# Copy file to container
#COPY tools/index.sh .
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
COPY	./conf/default.conf /etc/nginx/conf.d/default.conf

# Set defaulr shell
SHELL ["/bin/bash","-c"]

# Run commands before container initialization
RUN apt update && apt install -y nginx; \
	chown -R www-data:www-data /var/www/*; \
	chmod -R 777 /var/www/*

#RUN chmod 755 index.sh

EXPOSE 80

# Set default executable
ENTRYPOINT ["nginx"]

# Set entrypoint args
CMD ["-g","daemon off;"]
