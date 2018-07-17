docker-waarneming
====================

Docker compose file and docker files for running waarneming.nl

Contents
-------------
Dockerfiles and docker-compose to create waarneming.nl environment


.env file
```
OBS_BASE_PATH=/data/waarneming/obs
NOORDZEE_BASE_PATH=/data/waarneming/noordzee
NEDERLANDZOEMT_BASE_PATH=/data/waarneming/nederlandzoemt
PHPAPP_BASE_PATH=/data/waarneming/phpapp
MEDIA_BASE_PATH=/data/waarneming/media
```

Build containers first: 
-------------

```
cd django_2
docker build -t naturalis/waarneming-django-2:0.0.1 .
cd ..
cd php
docker build -t naturalis/waarneming-php:0.0.1 .
cd ..
```

## Generate local ssl keys
Keys are untrusted but usefull for development
```
cd scripts
./generate_ssh.sh
mv ssl/* ../nginx/nginx_ssl
```

Instruction running docker-compose.yml
-------------
nginx  
  configs in nginx/*
adjustments: 
- nginx_include/php* : fastcgi_pass            unix:/sock/php-fpm.socket;
- nginx_sites/beta.waarneming.nl : memcached_pass 127.0.0.1:11211;  ( instead of localhost ) 
- nginx_ssl/ place ssl certs here

obs, based on : django_2
volumes: 
/code   /data/waarneming/obs/django  <-  django / obs private repo. 
/static /data/waarneming/obs/static
current issue: socket permissions 

config ( db parameters ) : /data/waarneming/obs/django/.env

php  ( php-fpm )
container: 
cd php
docker build -t naturalis/waarneming-php:0.0.1 .
in zz-docker.conf config adjustment from tcp to socket based
also some extra php modules 

pgbouncer
create files from template  (pgbouncer.ini and userlist.txt)
- configure database IP in pgbouncer.ini 
- configure user list in userlist.txt

memcached
- nothing special

redis
- nothing special


````
docker-compose up
````

Usage
-------------

````


````

