docker-waarneming
====================

Docker compose file and docker files for running waarneming.nl

Contents
-------------
Dockerfiles creates various waarneming.nl containers


obs
-------------
Dockerfiles for obs django app. 

Defined in dockerfile
- python version
- system packages
- python pip virtualenv 
- supervisord config 
- docker-entrypoint.sh script

Container requires on mapping volume /code to the obs django repository which should include atleast a requirements.txt

.env file in obs django repository
```
DEBUG=True
DEBUG_TOOLBAR=False
DJANGO_EXTENSIONS=False

DB_NAME=waarneming
DB_USER=obs
DB_PASSWORD=xxxxx
DB_HOST=172.16.1.31  # <- make sure local ip of server is used, 127.0.0.1 will not work since pgbouncer does not run from within the docker container.
MEMCACHED_BACKEND=172.16.1.31:11211   # <- add this and make sure local ip of server is used, 127.0.0.1 will not work since memcached does not run from within the docker container.
```

Modify app/settings.py, replace fixed location of cache to environment variable location
```
CACHES = {
    'default': {
          'BACKEND': 'django.core.cache.backends.memcached.PyLibMCCache',
          'LOCATION': env('MEMCACHED_BACKEND', '127.0.0.1:11211'),
     },
```
When container is started with docker-compose then 

virtual environment is created and activated. 
```
virtualenv --no-site-packages /code/virtualenv
source /code/virtualenv/bin/activate
```

Python stuff is installed using pip and static files are collected + migrate is run 
```
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate
```

Last step server is started.
```
supervisord -c /opt/supervisor.conf -n
```

Since uwsgi uses a volume for the socket, access from nginx is possible from the host server. 

Instruction building image
-------------
No special instructions, all files in repo are used except README.md, LICENCE and docker-compose.yml
```
docker build naturalis/<app>:0.0.1 .
```

Instruction running docker-compose.yml
-------------
only docker-compose.yml is used


````
docker-compose up
````

Usage
-------------

````


````

