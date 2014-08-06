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

# note: Global installs [applicable to all envs] should be detailed inside the 
# Dockerfile, so that they can be properly cached by Docker

# env-specific installs & run
./$ENV/docker-build.sh
./$ENV/docker-run.sh
