#!/bin/ash


echo "Sleeps for 15s to initialize"
sleep 15s
mkdir -p /app/plex-data ; cd /data ; ln -s /app/plex-data

if [ ! -f /data/index.html ] ; then cp /app/index.html /data/ ; cp -R /app/assets /data/ ; chmod 0755 -R /data/ ; fi

while true; do  echo "Copping app-files to /data"
  
  php /app/cli.php -plex-url="$PLEX_URL" -sections="$PLEX_SECTIONS" -sort-skip-words="$PLEX_SORT_SKIP_WORDS" -token="$PLEX_TOKEN" || break

  echo ""

  echo ""
  echo "Sleep until next run in $PLEX_INTERVAL"
  sleep "$PLEX_INTERVAL" || break
  echo ""
  echo ""

done
