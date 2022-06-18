# Description

Basics of developing applications with Vagrant and Docker:
- Use Vagrant to create a virtual machine
- On the Vagrant VM:
    - Use Docker to create various services (database, web servers,...) for development
    - Develop the application
    - Build a Docker image for the application
    - Run the application image in a Docker container

Advantages:
- The development environment (the Vagrant VM) can be backed up or recreated on any computer easily
- Setting up support services such as database and webservers are easy
- Details of building the infrastructure are versioned

Disadvantages:
- Overhead of using Vagrant and Docker
- Complications of debugging Docker containers