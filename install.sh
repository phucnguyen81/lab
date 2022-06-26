#!/bin/bash -e

# Install required python version
sudo apt update
sudo apt -y install python3.11 python3.11-distutils

# Install python dependencies for app development.
# This assumes python and pipenv were installed previously.
cd hello
pipenv install --dev