#!/usr/bin/env bash

set -e
set -u

# Import GPG key to official MongoDB repository
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Creating a file list for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Updating APT
apt update -y

# Installing MongoDB and MySQL server.
apt install -y mongodb-org mysql-server

# Pre-seeding debconf with MySQL server answers
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

# Creating a file to manage the MongoDB service.
echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/mongodb.service

# Starting the MongoDB server
systemctl start mongodb

# Automatically start MongoDB when server starts
systemctl enable mongodb

# Restarting MySQL
systemctl restart mysql.server

echo "MongoDB and MySQL have been installed!"
