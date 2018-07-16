#!/bin/bash

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
/bin/sed -i -E "s/\{\{PYTHON_USER\}\}/$PYTHON_USER/g" /opt/supervisor.conf

supervisord -c /opt/supervisor.conf -n

