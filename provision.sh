#!/bin/bash

# Remove snapd permanently
sudo apt --yes --allow-change-held-packages purge snapd
sudo apt-mark hold snapd
sudo apt --yes autoremove

# Install Java development environment
sudo apt --yes install openjdk-11-jdk
