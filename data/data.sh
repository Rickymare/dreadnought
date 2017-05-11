#!/usr/bin/env bash

set -e
set -u

# Import GPG key to official MongoDB repository
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Create a file list for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update APT
apt update -y

# Install MongoDB package
apt install -y mongodb-org

# Creating a file to manage the MongoDB service.
echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/mongodb.service

# Staring the MongoDB server
systemctl start mongodb

# This will automatically start MongoDB
systemctl enable mongodb

echo "hey! I am at the end of the script"
