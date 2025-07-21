FROM alpine:latest

RUN apk add --no-cache dcron curl postgresql-client

COPY --chmod=755 piped-refresh.sh /piped-refresh.sh

COPY --chmod=755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
