#!/bin/bash

# Overwrite the config file
sudo cp --force /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

# Reload elasticsearch service
sudo systemctl start elasticsearch

# Start elasticsearch at startup
sudo systemctl enable elasticsearch

# Test elasticsearch
curl -X GET 'http://localhost:9200'