#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update -y

# Upgrade
apt upgrade -y
 
# Install HAProxy
apt install haproxy -y
