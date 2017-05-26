#!/usr/bin/env bash

set -e
set -u

# Updating APT
apt update -y

# Import GPG key to official MongoDB repository
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Creating a file list for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Installing Mongodb
apt install -y mongodb-org

# Starting the MongoDB server
systemctl start mongodb

# Creating  Database, User, and Password for NodeBB in MongoDB
echo "db.createUser( { user: "nodebbuser", pwd: "password", roles: [ { role: "readWrite", db: "nodebb" } ] )" | sudo mongo nodebb 

# Automatically start MongoDB when server starts
systemctl enable mongodb

# Pre-seeding debconf with MySQL server answers
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

# Installing MySQL server.
apt install -y mysql-server

# Creating Database, User, Password, and grant privileges in MySQL
mysql -uroot -ppassword -e "CREATE DATABASE magento;"
mysql -uroot -ppassword -e "CREATE USER 'magentouser'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON magento.* TO 'magentouser'@'localhost';"
mysql -uroot -ppassword -e "FLUSH PRIVILEGES;"

# Restarting MySQL
systemctl restart mysql.service

echo "MongoDB and MySQL have been installed!"
