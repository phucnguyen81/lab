#!/bin/bash

# Install kibana
sudo apt update
sudo apt --yes install kibana=$ES_VERSION

# Enable at startup
sudo systemctl enable kibana
sudo systemctl start kibana

# Access kibana using nginx reverse proxy
sudo cp --force /vagrant/kibana_site /etc/nginx/sites-available/kibana
sudo ln -s --force /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/
# Reload to apply changes
sudo systemctl reload nginx
