#!/bin/bash

# Remove the snapd package manger permanently
sudo apt --yes --allow-change-held-packages purge snapd
sudo apt-mark hold snapd
sudo apt --yes autoremove

# Install Java development environment
sudo apt --yes install openjdk-11-jdk

# Install elasticsearch
./install_elasticsearch.sh

# Install nginx
./install_nginx.sh