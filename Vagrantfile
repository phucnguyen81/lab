# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# The most common configuration options are documented and commented below.
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine. In the example below,
# accessing "localhost:8080" will access port 80 on the guest machine.
# NOTE: This will enable public access to the opened port
# config.vm.network "forwarded_port", guest: 8000, host: 8000

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine and only allow access
# via 127.0.0.1 to disable public access
# config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

# Create a private network, which allows host-only access to the machine
# using a specific IP.
# config.vm.network "private_network", ip: "192.168.33.10"

# Create a public network, which generally matched to bridged network.
# Bridged networks make the machine appear as another physical device on
# your network.
# config.vm.network "public_network"

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant"

  # Install avahi on all machines
  config.vm.provision "shell", inline: <<-SHELL
    # Remove snapd permanently
    apt purge snapd
    apt-mark hold snapd

    # Install avahi to map hostname to ip
    apt-get install -y avahi-daemon libnss-mdns
  SHELL

  config.vm.define "sun", primary: true do |node|
    node.vm.box = "bento/ubuntu-20.04"
    node.vm.hostname = "sun"
    node.vm.network :private_network, ip: "10.0.0.10"

    # Use VirtualBox provider to create the VM
    node.vm.provider "virtualbox" do |vb|
      vb.name = "sun"
      vb.memory = 2048  # 2GB
      vb.cpus = 2  # 2 cores
    end

    # Generate ssh key
    node.vm.provision "shell", privileged: false, inline: <<-SHELL
      # Generate ssh key
      ssh-keygen -t rsa -b 4096 -f ~/.ssh/nodes.key -C "Shared insecure nodes key" -N ""
      # Copy keys to shared directory
      cp --force ~/.ssh/nodes.key.pub /vagrant/tmp/nodes.key.pub
      # Set ssh config
      cp --force /vagrant/ssh_config_sun ~/.ssh/config
    SHELL
  end

  config.vm.define "mercury" do |node|
    node.vm.box = "bento/ubuntu-20.04"
    node.vm.hostname = "mercury"
    node.vm.network :private_network, ip: "10.0.0.11"

    # Use VirtualBox provider to create the VM
    node.vm.provider "virtualbox" do |vb|
      vb.name = "mercury"
      vb.memory = 1024
      vb.cpus = 1
    end

    node.vm.provision "shell", privileged: false, inline: <<-SHELL
      touch ~/.ssh/authorized_keys
      chmod 600 ~/.ssh/authorized_keys
      PUBKEY=$(cat /vagrant/tmp/nodes.key.pub); grep -q "$PUBKEY"  ~/.ssh/authorized_keys || echo "$PUBKEY" >> ~/.ssh/authorized_keys
    SHELL
  end

  config.vm.define "venus" do |node|
    node.vm.box = "bento/ubuntu-20.04"
    node.vm.hostname = "venus"
    node.vm.network :private_network, ip: "10.0.0.12"

    # Use VirtualBox provider to create the VM
    node.vm.provider "virtualbox" do |vb|
      vb.name = "venus"
      vb.memory = 1024
      vb.cpus = 1
    end

    node.vm.provision "shell", privileged: false, inline: <<-SHELL
      touch ~/.ssh/authorized_keys
      chmod 600 ~/.ssh/authorized_keys
      PUBKEY=$(cat /vagrant/tmp/nodes.key.pub); grep -q "$PUBKEY"  ~/.ssh/authorized_keys || echo "$PUBKEY" >> ~/.ssh/authorized_keys
    SHELL

    # Must run last to clean up temp files
    node.vm.provision "shell", privileged: false, inline: <<-SHELL
      rm /vagrant/tmp/nodes.key.pub
    SHELL
  end
end