FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libmemcached-dev \
        libmemcachedutil2 \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install sockets

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install memcached (as we are on Debian 8 we have libmemcached 1.0.18 which is recommended)
RUN for i in $(seq 1 3); do echo no | pecl install -o memcached && s=0 && break || s=$? && sleep 1; done; (exit $s) \
    && docker-php-ext-enable memcached 

COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf