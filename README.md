Docker Dynamic Build
====================

A simple proof of concept to show how to build multiple environments [local, dev, staging, production etc] from a single Dockerfile.

Steps
-----
1. Pull the repo `git@github.com:pemcconnell/docker-folder-structure.git`
2. Build the box `sudo docker build -t="petermcconnellisasexybastard" .`
3. Run with your desired env specified `sudo docker run -P -d -e ENV=dev petermcconnellisasexybastard` (swap out 'dev' for whatever env you desire)

How it works
------------

Simple really - Docker run will execute ./run.sh, which is passed the ENV variable from your `docker run` command.

