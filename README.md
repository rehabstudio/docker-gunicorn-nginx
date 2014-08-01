Docker Multi-provisioning Build
===============================

A simple proof of concept to show how to build multiple environments [eg. local, dev, staging, production] from a single Dockerfile.

Steps
-----
1. Pull the repo `git@github.com:rehabstudio/docker-multiprovisioning-template.git`
2. Build the box `sudo docker build -t="rehabstudio/multiprov" .`
3. Run with your desired env specified `sudo docker run -P -d -e ENV=dev rehabstudio/multiprov` (swap out 'dev' for whatever env you desire. This relates to the folder names in the ./ops/ folder)

How it works
------------

Simple really - Docker run will execute ./ops/run.sh, which is passed the ENV variable from your `docker run` command.

