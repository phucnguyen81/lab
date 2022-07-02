# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# The most common configuration options are documented and commented below.
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

# Every Vagrant development environment requires a box. You can search for
# boxes at https://vagrantcloud.com/search.
# config.vm.box = "bento/ubuntu-20.04"

# Disable automatic box update checking. If you disable this, then
# boxes will only be checked for updates when the user runs
# `vagrant box outdated`. This is not recommended.
# config.vm.box_check_update = false

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

# Share an additional folder to the guest VM. The first argument is
# the path on the host to the actual folder. The second argument is
# the path on the guest to mount the folder. And the optional third
# argument is a set of non-required options.
# config.vm.synced_folder ".", "/vagrant"

# Provider-specific configuration so you can fine-tune various
# backing providers for Vagrant. These expose provider-specific options.
# View the documentation for the provider you are using for more
# information on available options.
# Use VirtualBox provider to create the VM
# config.vm.provider "virtualbox" do |vb|
#   vb.name = vm_name
#   vb.memory = 4096  # 4GB
#   vb.cpus = 4  # 4 cores
# end

Vagrant.configure("2") do |config|
  config.vm.define "vma", primary: true do |vma|
    vma.vm.box = "bento/ubuntu-20.04"
    vma.vm.hostname = "vma"
    vma.vm.network :private_network, ip: "10.0.0.10"

    # Use VirtualBox provider to create the VM
    vma.vm.provider "virtualbox" do |vb|
      vb.name = "vma"
      vb.memory = 2048  # 2GB
      vb.cpus = 2  # 2 cores
    end
  end

  config.vm.define "vmb" do |vmb|
    vmb.vm.box = "bento/ubuntu-20.04"
    vmb.vm.hostname = "vmb"
    vmb.vm.network :private_network, ip: "10.0.0.11"

    # Use VirtualBox provider to create the VM
    vmb.vm.provider "virtualbox" do |vb|
      vb.name = "vmb"
      vb.memory = 2048  # 2GB
      vb.cpus = 2  # 2 cores
    end
  end

  # Install avahi on all machines
  config.vm.provision "shell", inline: <<-SHELL
    # Remove snapd permanently
    apt purge snapd
    apt-mark hold snapd

    # Install avahi to map hostname to ip
    apt-get install -y avahi-daemon libnss-mdns
  SHELL
end