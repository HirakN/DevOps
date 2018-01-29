#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y 

# Install 
sudo apt-get install nginx -y

# Install nodejs v6
sudo apt-get install nodejs -y
sudo curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash ./nodesource_setup.sh
sudo apt-get install nodejs -y

# Install pm2 wiht npm
sudo npm install pm2 -g