#!/bin/bash

# Install specific version of nginx
sudo apt update
sudo apt -y install nginx=1.18.0-0ubuntu1.3
# Test installation status
systemctl status nginx

# Allow network traffic for nginx service (port 80 and 443)
sudo ufw allow 'Nginx Full'

# Replace nginx config
sudo cp --force /vagrant/nginx.conf /etc/nginx/nginx.conf
# Reload to apply changes
sudo systemctl reload nginx

