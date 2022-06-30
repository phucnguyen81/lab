#!/bin/bash

# Add python package repo
sudo add-apt-repository ppa:deadsnakes/ppa --yes
sudo apt update

sudo apt --yes install software-properties-common python3-pip

# Install pipenv for python development
sudo python3 -m pip install pipenv
