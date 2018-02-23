FROM postgres:10
MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>

ENV POSTGIS_MAJOR 2.4
ENV POSTGIS_VERSION 2.4.3+dfsg-2.pgdg90+1

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           locales-all \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

RUN localedef -i nl_NL -c -f UTF-8 -A /usr/share/locale/locale.alias nl_NL.UTF-8 && \
    locale-gen nl_NL.UTF-8
ENV LANG nl_NL.UTF-8


RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin

