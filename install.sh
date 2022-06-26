#!/bin/bash

# Install pipenv for python development
sudo apt update
sudo apt --yes install software-properties-common
sudo apt --yes install python3-pip
sudo python3 -m pip install pipenv

# Add python package repo
sudo add-apt-repository ppa:deadsnakes/ppa --yes
sudo apt update
