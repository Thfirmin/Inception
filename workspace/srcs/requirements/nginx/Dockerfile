# Use an existing image as base
FROM	debian:bullseye

VOLUME [ "/app-vol" ]

WORKDIR /app

COPY ./tools/index.sh /app/

RUN chmod 755 ./index.sh

# Run command after container initialization
CMD ["./index.sh"]
