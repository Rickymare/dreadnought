#!/usr/bin/env bash
# This script will install and configure NodeBB

set -e
set -u

# Update the APT cache 
apt update -y

# Upgrade
# apt upgrade -y

# Install Nodejs, Nodejs-legacy, npm, and mongodb-server
apt install nodejs nodejs-legacy npm mongodb-server -y

# Clone the NodeBB package from Github
git clone -b v1.5.x https://github.com/NodeBB/NodeBB.git nodebb

# Install NodeBB
npm install --production nodebb/

# Starting the server
npm start
