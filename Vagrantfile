# -*- mode: ruby -*-
# vi: set ft=ruby :

# Same name for both vagrant environment and virtualbox vm
vm_name = "ci_docker_jenkins"

jenkins_home = "var/lib/jenkins"

env = {
    "JENKINS_HOME" => jenkins_home,
    "JENKINS_PLUGINS_DIR" => "#{jenkins_home}/plugins",
    "JENKINS_PLUGINS_FILE" => "/vagrant/jenkins/plugins.txt",
}

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-20.04"

  # Define the vm name (otherwise `default` is used)
  config.vm.define vm_name do |t| end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8080, host: 8080

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
  config.vm.synced_folder "vagrant", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # View the documentation for the provider you are using for more
  # information on available options.
  #
  # Use VirtualBox to create the VM.
  config.vm.provider "virtualbox" do |vb|
    vb.name = vm_name
    vb.memory = 4096
    vb.cpus = 4
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", env: env, inline: <<-SHELL
    cp --force /vagrant/configs/etc_environment /etc/environment

    # Install common packages
    apt update
    apt install ca-certificates curl gnupg lsb-release

    # Instal docker
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    # Test docker
    docker run hello-world
    # Let vagrant user uses docker CLI
    usermod -aG docker vagrant

    # Add docker user
    useradd -g docker --create-home docker
    echo docker:docker | chpasswd

    # Add jenkins user
    useradd -g docker --create-home jenkins
    echo jenkins:jenkins | chpasswd

    # Install python
    apt update
    apt install software-properties-common
    add-apt-repository ppa:deadsnakes/ppa
    apt update
    apt -y install python3.11 python3.11-distutils
    # Install pip
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
    # Install pipenv
    python3.11 -m pip install pipenv
    # Install python dependencies for app development
    runuser -u vagrant -- pipenv install --dev

    # Build app image
    cd /vagrant/hello
    docker build -t my_hello -f Dockerfile_hello .

    # Install jenkins and plugins
    sudo apt install -y openjdk-11-jre
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
    sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    apt update
    apt install -y jenkins
    wget -O /opt/jenkins-plugin-manager.jar https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.6/jenkins-plugin-manager-2.12.6.jar
    java -jar /opt/jenkins-plugin-manager.jar --war /usr/share/java/jenkins.war --plugin-file "$JENKINS_PLUGINS_FILE" --plugin-download-directory "$JENKINS_PLUGINS_DIR"
  SHELL
end
