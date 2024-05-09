# Use an existing image as base
FROM	debian:bullseye

# Define starter directory
WORKDIR /app

# Copy file to container
COPY tools/ .
COPY conf/ .

# Set defaulr shell
SHELL ["/bin/bash","-c"]

# Run commands before container initialization
RUN apt update && apt install -y php-fpm php-mysql; \
	chmod 755 ./index.sh

EXPOSE 9000

# Set default executable
ENTRYPOINT ["./index.sh"]

# Set entrypoint args
#CMD ["wp"]

