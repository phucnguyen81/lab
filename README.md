# Description

Create a Vagrant VM as initial environment.

- Run `vagrant up --provision` to create the VM
- Run `vagrant ssh` to ssh into the VM
- Run `vagrant reload` to apply changes to Vagrantfile
- Run `vagrant suspend` to sleep
- Run `vagrant halt` to turn off
- Run `vagrant destroy` to remove the existing VM

# Install Java Environment
- Install OpenJDK 11: `sudo apt --yes install openjdk-11-jdk`
- Set $JAVA_HOME in /ect/environment: `JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"`