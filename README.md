Docker Python Base
==================

A bare bones python Docker setup to support local and production development from a single ops base

##Steps to run

1. `make all`. Note: you may need to run this as sudo, depending on how your docker install is set up, eg. `sudo make all`

##Useful Docker Commands (use with care)

- View docker images
```
sudo docker images
```
- List actively running images (add -l to include stopped containers)
```
sudo docker ps
```
- View container logs
```
sudo docker logs -f <containerID>
```
- Stop container
```
sudo docker stop <containerID>
```
- Delete dead images 
```
for i in `sudo docker images|grep \<none\>|awk '{print $3}'`;do sudo docker rmi $i;done
```
- Delete containers 
```
sudo docker rm -f `sudo docker ps --no-trunc -a -q`
```
