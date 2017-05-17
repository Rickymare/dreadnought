#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update -y

# Upgrade
# apt upgrade -y
 
# Installing PHP and nginx
apt install libcurl3 php5-curl php5-gd php5-mcrypt nginx

# Downloading Magento
wget http://www.magentocommerce.com/downloads/assets/1.9.0.1/magento-1.9.0.1.tar.gz

# Extracting the Magento package
tar xzvf magento-1.9.0.1.tar.gz -C /
