#!/bin/bash

#Install Docker if not installed already
if ! command -v docker &> /dev/null; then
    echo "Docker not installed. Installing..."
    wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-amd64.deb
    sudo apt install ./docker-desktop-4.12.0-amd64.deb
fi


#Pull the required images from DockerHub
sudo docker pull postgres:latest

#Launch Docker compose
sudo docker-compose up &
sleep 10

echo "Strapi application successfully deployed"