# Description

Create a Vagrant VM as initial environment for everything else.

- Run `vagrant up --provision` to create the VM
- Run `vagrant ssh` to ssh into the VM
    - If needed, run `./install_common_tools.sh` to install common tools
    - If needed, run `./install_ansible.sh` to install Ansible
- Run `vagrant reload` to apply changes to Vagrantfile minus provision
- Run `vagrant halt` to power down and save the VM state
- Run `vagrant destroy` to remove the existing VM