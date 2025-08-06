#!/bin/bash
#meta data: THis script will install docker on the ubuntu server and pull docker image and run that image.

#Author Mohd Nasar

sudo apt update -y

sudo apt install docker.io -y

sudo usermod -aG docker ubuntu 



docker --version

docker pull mnasar12/rps

docker run mnasar12/rps 

docker ps
