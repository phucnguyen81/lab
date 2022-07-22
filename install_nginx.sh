#!/bin/bash

# Install specific version of nginx
sudo apt update
sudo apt -y install nginx=1.18.0-0ubuntu1.3

# Allow network traffic for nginx service (port 80 and 443)
sudo ufw allow 'Nginx Full'

# Test nginx status
systemctl status nginx

# Add a custom site
sudo mkdir -p /var/www/elastic/html
sudo chown -R vagrant:vagrant /var/www/elastic/html
sudo chmod -R 755 /var/www/elastic
sudo cp --force /vagrant/index.html /var/www/elastic/html/index.html
sudo cp --force /vagrant/elastic_site /etc/nginx/sites-available/elastic
sudo ln -s /etc/nginx/sites-available/elastic /etc/nginx/sites-enabled/

# Replace nginx config
sudo cp --force /vagrant/nginx.conf /etc/nginx/nginx.conf

# Restart nginx to apply changes
sudo systemctl restart nginx
