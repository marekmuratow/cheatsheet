# check docker version
$ docker version

# get info about docker containers, images and more
$ sudo docker info

# show system journal for docker (use while debugging) 
$ journalctl -u docker

# search a docker repository for images
$ sudo docker search mysql | head -5

# list docker images
$ sudo docker images

# pull an image from a repository (latest version by default)
$ sudo docker pull busybox

# pull an image from a repository (version:1:25)
$ sudo docker pull busybox:1.25

# check a history in an image
$ sudo docker history ad8f9b68cb5f

# run a container 
$ sudo docker run hello-world

# run container and automatically remove the container when it exits
$ sudo docker run --rm hello-world

# run a container and attach the terminal to it (-i interactive, -t terminal)
$ sudo docker run -i -t ubuntu /bin/bash

# detach the terminal from the container and return to docker ($)
Ctrl + P and Ctrl + Q

# list running containers
$ sudo docker ps

# list all containers including stopped ones
$ sudo docker ps -a

#  attach the terminal to the running container
$ sudo docker attach 6a8523a780fa

# show changes in the container
$ sudo docker diff 94e5c2570390

# stop the container
$ sudo docker stop 94e5c2570390

# start the stopped container
$ sudo docker start 94e5c2570390

# restart (stop + start) the container
$ sudo docker restart 94e5c2570390

# pause all processes in the container
$ sudo docker pause 94e5c2570390

# unpause all processes in the container
$ sudo docker unpause 94e5c2570390

# remove the container
$ sudo docker rm 7fec65018e2a

# remove all stopped containers
$ sudo docker container prune

# commit changes in the container
$ sudo docker commit agitated_hoover learning/ubuntu

# run the detached container (-d detached)
$ sudo docker run  -d ubuntu /bin/bash -c "while true ;do date; sleep 5; done"

# see container logs
$ sudo docker logs hardcore_mahavira

################
### Dockerfile
################

# build an image based on a Dockerfile with specified name/tag -t
$ sudo docker build -t somename .

# build an image based on a Dockerfile with specified name/tag -t and version
$ sudo docker build -t somename:01 .

# add tag/repository name to the existing image
$ sudo docker tag 01ef789fda34 somename

# hashtag sign is used as the comment

# FROM – usually the first instruction in a Dockerfile, specifies a base docker image
FROM <image>[:<version>|@<digest>]
FROM ubuntu:16.04

# MAINTAINER – usually second instruction in the Dockerfile
MAINTAINER Mark Muratow contact@entito.pl

# COPY – copies files, creates missing directories and overwrites files
COPY <source> <destination>

# ADD like a COPY, but cat extract tar files, and add from data from URL
ADD <source> <destination>

# ENV – environment variable, which can be used by all scripts and apps in the image
ENV <key> <value>

# ARG – argument which can be used in the Dockerfile, arg name can be set during build (--build-arg NAME=VALUE)
ARG name[=defaultValue]

ARG VERSION
ADD ./file.tar /custom/go/$VERSION

$ sudo docker build --build-arg VERSION=99 .

# USER – container runs as a specified user (root by default)
RUN useradd -ms /bin/bash  someuser
USER someuser

# WORKDIR - changes a current path from / to <path>. RUN, CMD, ENTRYPOINT runs from that path
WORKDIR <path>

# VOLUME – adds a volume to the image
VOLUME ["/some/vol1", "/some/vol2"]

# EXPOSE – opens container port for external communication (used with run -p or -P)
EXPOSE 8080

# RUN – specifies commands executed during image building
RUN <expression> # run as /bin/sh -c <expression>
RUN [<exec> <arg1> … <argN>]

# CMD – specifies commands executed during starting a container
CMD <expression>
CMD echo Hello World!

CMD  [<exec> <arg1> … <argN>]
CMD ["echo", "Hello World!"]

CMD  [<arg1> … <argN>] # default parameters for ENTRYPOINT

# ENTRYPOINT – like CMD but cannot be overridden by a docker run command
ENTRYPOINT <expression>
ENTRYPOINT  [<exec> <arg1> … <argN>]

# HEALTH CHECK
HEALTHCHECK <options> CMD <expression>

# disable existing HEALTHCHECK
HEALTHCHECK NONE

# .dockerignore – files ignored during build
.dockerignore

################
### NETWORK
################

#  list networks (docker creates 3 networks by default: bridge, host, none. A new container is connected to the bridge network by default).
$ sudo docker network ls

# run a container and add it to the network (--net or --network)
$ sudo docker run -it --net custom ubuntu /bin/bash
$ sudo docker run -it --network custom ubuntu /bin/bash

# check ip
$ sudo docker run --rm  busybox ip addr

# check network ip on the host
ip addr show docker0

#check IP address
sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' quirky_elbakyan

# list NAT iptables
$ sudo iptables -t nat -L -n

# check which host’s port is binded to the specified container’s port
$ sudo docker port 2d4b8594e925 80
0.0.0.0:80

# bind host’s 50 port to the container’s 80 port
$ sudo docker run -d -p 50:80 5af6705d3f46

# bind host’s random port to the container’s 80 port 
$ sudo docker run -d -p 80 5af6705d3f46

# bind host’s random port to the Dockerfile.EXPOSE port
$ sudo docker run -d -P  5af6705d3f46

################
### VOLUMES
################

# create a volume
$ sudo docker volume create --name custom_vol

# list volumes
$ sudo docker volume ls

# inspect a volume
$ sudo docker volume inspect 278b2791208ec7d3913cad2474c7c8c08148aaa3f3b678c90cdf4b472b29195e

# remove a volume
$ sudo docker volume rm 278b2791208ec7d3913cad2474c7c8c08148aaa3f3b678c90cdf4b472b29195e

# run a container with an internal volume
$ sudo docker run -it -v /dir ubuntu /bin/bash

# run a container with a shared host’s folder  /home/dir and mount it in the container as /dir
$ sudo docker run -it -v /home/dir:/dir ubuntu /bin/bash

# run a container with a volume – volume will be created if not exists
$ sudo docker run -it -v custom_vol:/dir  ubuntu /bin/bash

# use volumes from another container
$ sudo docker run -it --volumes-from 8b86557d0364 ubuntu /bin/bash

################
### OTHER
################

# run camunda in the container
sudo docker run -d --name camunda -p 8080:8080 camunda/camunda-bpm-platform:latest

# create local docker registry
https://docs.docker.com/registry/

################
### TODO
################
# pushing images into a registry
sudo docker push

# DOckerfile
Dockerfile: LABEL, ONBUILD, STOPSIGNAL, SHELL
