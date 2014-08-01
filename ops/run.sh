#!/bin/bash

# make sure the environment variable 'ENV' is set
if [ -z "$ENV" ]
then
    echo "!!! You must set an ENV variable !!!"
    echo "docker run -P -d -e ENV=dev <yourboxname>"
    exit
fi

# make sure the environment variable 'ENV' matches a folder
if [ ! -d "./$ENV" ]
then
    echo "!!! Your ENV variable must match a folder name in ./ops/ !!!"
    echo "docker run -P -d -e ENV=<foldername> <yourboxname>"
    exit
fi

# global
./_global/base-build.sh

# env-specific
./$ENV/docker-build.sh
./$ENV/docker-run.sh
