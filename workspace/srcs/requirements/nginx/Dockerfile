# Stage 1: Build (Contains build tools)
FROM debian:bullseye AS builder

WORKDIR /app

COPY ./tools/index.sh /app/ 0755

# Stage 2: Runtime (Only includes necessary files)
FROM nginx:latest

COPY --from=builder /app/index.sh /app/ 0755

CMD ["/app/index.sh"]
