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

# Run Chapter 02
- Go to Chapter02: `cd /vagrant/code/Chapter02`
- Build the code: `./mvnw clean package`
- Go to build directory: `cd target/`
- Run the package: `java -jar hello-world-0.0.1-SNAPSHOT.jar`

# Install MySQL
 - Install mysql server: `sudo apt --yes install mysql-server-8.0`
 - Check mysql service is running: `systemctl status mysql.service`
 - Connect to mysql as root user: `sudo mysql -u root`
   - Change root authentication to password: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'p@ssw0rd';`
   - Create database: `CREATE DATABASE spring_batch;`