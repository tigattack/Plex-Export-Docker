#!/bin/ash

[ ! -f /data/index.html ] && {
  touch /data/index.html
  cp /app/index.html /data/index.html
}
[ ! -d /data/assets ] && cp -R /app/assets /data/
[ ! -d /data/plex-data ] && mkdir /data/plex-data

echo "Performing first-run..."
/plex-export.sh

crond && nginx
