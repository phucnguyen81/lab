#!/bin/bash -e
# Install Vagrant
sudo apt update
sudo apt -y install software-properties-common lsb-release
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt -y install vagrant