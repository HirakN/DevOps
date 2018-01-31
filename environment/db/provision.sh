#!/bin/bash

# update and upgrade
# sudo apt-get update -y
# sudo apt-get upgrade -y

# Get MongoDB public key for auhtneticity
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Create list for mongodb
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update
sudo apt-get update -y

# Install mongo with version 3.2.18
sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18

# Stop auto-updating of mongodb
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Copy file for...reasons...
sudo rm /lib/systemd/system/mongod.service
sudo cp /home/ubuntu/templates/mongod.service /lib/systemd/system/

# Change port to 0.0.0.0
sudo rm /etc/mongod.conf
sudo cp /home/ubuntu/templates/mongod.conf /etc/

# Start mongo service
# sudo service mongod start
sudo systemctl start mongod

# Enable service
sudo systemctl enable mongod