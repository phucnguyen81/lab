#!/bin/bash

### Remove the snapd package manger permanently
sudo apt --yes --allow-change-held-packages purge snapd
sudo apt-mark hold snapd
sudo apt --yes autoremove

### Install Java development environment
sudo apt --yes install openjdk-11-jdk

### Install elasticsearch
# Adds the public GPG key
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
# Install specific version of elasticsearch
sudo apt install elasticsearch=7.17.5

### Configure elasticsearch
# Overwrite the config file
sudo cp --force /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
# Reload elasticsearch service
sudo systemctl start elasticsearch
# Enable elasticsearch at startup
sudo systemctl enable elasticsearch
# Test elasticsearch
curl -X GET 'http://localhost:9200'