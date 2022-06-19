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

# Installation

- Install Vagrant
- Create Vagrant VM: `vagrant up --provision`

# Development

- SSH into Vagrant VM: `vagrant ssh`
- Run development server: `pipenv run python manage.py runserver`
- To develope with VS Code: search for `Vagrant VS Code remote SSH development`

# Dockerize the app

- Build docker image: `docker build -t hello .`
- Run the app in Docker container: `docker run -d -p 8000:8000 hello`

