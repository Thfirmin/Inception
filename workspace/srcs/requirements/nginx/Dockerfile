# Use an existing image as base
FROM	debian:bullseye

# Define starter directory
#WORKDIR /app

# Copy file to container
#COPY tools/index.sh .

# Set defaulr shell
SHELL ["/bin/bash","-c"]

# Run commands before container initialization
RUN apt update &&\
apt install -y nginx

#RUN chmod 755 index.sh

EXPOSE 80

# Set default executable
ENTRYPOINT ["nginx"]

# Set entrypoint args
CMD ["-g","daemon off;"]

