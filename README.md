Docker Python Base
==================

A bare bones python Docker setup to support local and production development from a single ops base

##Steps

1. Pull the repo
2. Build the box `sudo docker build -t="rehabstudio/pythonproject" .`
3. Run with your desired env specified `sudo docker run -P -v=/var/www/Sites/docker-python-base/app/:/var/www/app:rw -d -e ENV=live rehabstudio/pythonproject` (swap out 'local' for 'production' if needs be, and /var/www/Sites/docker-python-base/app/ for the relevant absolute path on your computer )

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
