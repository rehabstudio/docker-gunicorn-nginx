#!/bin/bash

APP_PATH=/var/app

# installs
apt-get install -y nginx supervisor

# pip
pipPath=$APP_PATH/requirements.txt
if [ -f $pipPath ];
then
    pip install -r $pipPath
fi

# supervisor
ln -sf /ops/live/supervisord.conf /etc/supervisord.conf

# nginx
ln -sf /ops/live/vhost.conf /etc/nginx/sites-enabled/default
chown -R www-data $APP_PATH
service nginx restart
