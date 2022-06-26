#!/bin/bash

# Install pipenv for python development
sudo apt update
sudo apt -y install software-properties-common
sudo apt -y install python3-pip
sudo python3 -m pip install pipenv

# Add python package repo
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
