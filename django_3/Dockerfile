FROM python:3.6

MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>
LABEL Description="Python django app, based on Python 2.7." 

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1


# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        libmemcached-dev \
        libmemcached11 \
        libmemcachedutil2 \
        binutils \
        libproj-dev \
        gdal-bin \
        libz-dev \
        supervisor \
        postgresql-client \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#RUN pip install django-dotenv

WORKDIR /code
ADD supervisor.conf /opt/supervisor.conf
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
