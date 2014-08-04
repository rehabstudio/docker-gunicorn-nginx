#!/bin/bash

# start supervisor services
supervisord -c /etc/supervisord.conf -n
