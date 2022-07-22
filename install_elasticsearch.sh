#!/bin/bash

# Install specific version of elasticsearch
sudo apt update
sudo apt install elasticsearch=$ES_VERSION

### Configure elasticsearch
# Overwrite the config file
sudo cp --force /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
# Reload elasticsearch service
sudo systemctl start elasticsearch
# Enable elasticsearch at startup
sudo systemctl enable elasticsearch
# Test elasticsearch
curl -X GET 'http://localhost:9200'

# Add a custom site
sudo mkdir -p /var/www/elastic/html
sudo chown -R vagrant:vagrant /var/www/elastic/html
sudo chmod -R 755 /var/www/elastic
sudo cp --force /vagrant/index.html /var/www/elastic/html/index.html
sudo cp --force /vagrant/elastic_site /etc/nginx/sites-available/elastic
sudo ln -s --force /etc/nginx/sites-available/elastic /etc/nginx/sites-enabled/
# Reload to apply changes
sudo systemctl reload nginx