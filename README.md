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

# Run the app with Docker

- Build the app image: `docker build -t my_hello -f Dockerfile_hello .`
- Run the app in container: `docker run --name my_hello -d -p 8000:8000 my_hello`

# Run Jenkins with Docker

- Build Jenkins image: `docker build -t my_jenkins -f Dockerfile_jenkins .`
- Run Jenkins in container: `docker run --name my_jenkins -d -p 8080:8080 my_jenkins`

