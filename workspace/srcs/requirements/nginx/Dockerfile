# Stage 1: Build (Contains build tools)
FROM debian:bullseye AS builder

VOLUME [ "/data" ]

WORKDIR /app

COPY --from=0 /app/index.sh /app/ 0755

CMD ["/app/index.sh"]
