# Use an existing image as base
FROM	debian:bullseye

# Define starter directory
WORKDIR /app

# Copy file to container
COPY tools/index.sh	.
COPY conf/config.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Set defaulr shell
SHELL ["/bin/bash","-c"]

# Run commands before container initialization
RUN apt update && apt install -y --no-install-recommends mariadb-server && apt clean; \
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/database;

EXPOSE 3306

# Set default executable
ENTRYPOINT ["/bin/bash"]

# Set entrypoint args
CMD ["index.sh"]

