#!/bin/bash
# Install ansible
sudo apt update
sudo apt -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt -y install ansible

