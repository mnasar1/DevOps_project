#!/bin/bash
#meta data: THis script will install docker on the ubuntu server and pull docker image and run that image.

<<<<<<< HEAD
#Author Mohd Nasar (Md)
=======
#Author Mohd Nasar
#date : MM-DD-YYYY
>>>>>>> 71965f34b37b407ec71cad30e8424808e4c7cea0

sudo apt update -y

sudo apt install docker.io -y

sudo usermod -aG docker ubuntu 



docker --version

docker pull mnasar12/rps

docker run mnasar12/rps 

docker ps


