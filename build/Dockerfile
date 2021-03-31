FROM php:alpine


ENV PLEX_URL="http://localhost:32400"
ENV PLEX_SECTIONS=all
ENV PLEX_SORT_SKIP_WORDS=""
ENV PLEX_TOKEN=
ENV PLEX_INTERVAL=60m


#Updates everything
RUN apk update && apk add --no-cache git

#Clones git repo (content) into /var/www/html
WORKDIR /app
RUN git clone https://github.com/Dachande663/Plex-Export.git . &&\
    git clone https://github.com/dpDesignz/plex-export-responsive-skin &&\
    cp -rf plex-export-responsive-skin/* ./ &&\
    rm LICENSE README.md

RUN if [ ! -f /data/index.html ] ; then cp /app/index.html /data/ ; cp -R /app/assets /data/ ; ln -s /app/plex-data/ /data/plex-data ; chmod 0755 -R /data/ ; fi

#Copies entrypoint-script for modifying .env-file
COPY build/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
