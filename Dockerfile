FROM php:alpine

ENV PLEX_URL=""
ENV PLEX_SECTIONS="all"
ENV PLEX_SORT_SKIP_WORDS=""
ENV PLEX_TOKEN=""
ENV CRON_SCHEDULE="0 * * * *"

RUN apk update && \
    apk add --no-cache nginx && \
    echo "$CRON_SCHEDULE /plex-export.sh > /proc/1/fd/1 2>&1" >/etc/crontabs/root && \
    mkdir -p /app/plex-data

WORKDIR /app
COPY build/ /

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
