#!/bin/ash

php /app/cli.php \
  -plex-url="$PLEX_URL" \
  -sections="$PLEX_SECTIONS" \
  -sort-skip-words="$PLEX_SORT_SKIP_WORDS" \
  -token="$PLEX_TOKEN"

mv /app/plex-data/* /data/plex-data/
