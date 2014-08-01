#!/bin/bash

if [ -z "$ENV" ]
then
    echo "!!! You must set an ENV variable !!!"
    echo "docker run -P -d -e ENV=dev <yourboxname>"
    exit
fi

./$ENV/docker-build.sh
./$ENV/docker-run.sh
