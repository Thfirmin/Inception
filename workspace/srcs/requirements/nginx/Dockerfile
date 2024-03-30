# Stage 1: Build (Contains build tools)
FROM debian:bullseye AS builder

WORKDIR /app

COPY ./tools/index.sh /app/

RUN chmod 755 ./index.sh

# Stage 2: Runtime (Only includes necessary files)
FROM nginx:latest

VOLUME [ "/app-vol" ]

COPY --from=builder /app/index.sh /app/

CMD ["/app/index.sh"]
