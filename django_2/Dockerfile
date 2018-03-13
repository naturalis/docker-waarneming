FROM python:2.7

MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>
LABEL Description="Python django app, based on Python 2.7." 

ENV PYTHONUNBUFFERED 1

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        libmemcached-dev \
        zlib1g-dev \
        libgdal1h \
        supervisor \
        postgresql-client \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install virtualenv

WORKDIR /code
ADD supervisor.conf /opt/supervisor.conf
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
