#!/bin/bash

# create virtual environment and activate
virtualenv --no-site-packages /code/virtualenv
source /code/virtualenc/bin/activate

# Install using requirements.txt
pip install -r requirements.txt

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

# Start server
echo "Starting server"
supervisord -c /opt/supervisor.conf -n

