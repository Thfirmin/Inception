# Use an existing image as base
FROM	debian:bullseye

# Define starter directory
WORKDIR /app

# Copy file to container
COPY tools/index.sh .

# Set defaulr shell
SHELL ["/bin/bash","-c"]

# Run commands before container initialization
RUN chmod 755 index.sh

# Set default executable
ENTRYPOINT ["./index.sh"]

# Set entrypoint args
CMD ["nginx"]

