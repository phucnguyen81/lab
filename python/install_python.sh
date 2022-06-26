#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt -y install python3.11 python3.11-distutils
# Install pip
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.11
# Install pipenv
sudo python3.11 -m pip install pipenv
