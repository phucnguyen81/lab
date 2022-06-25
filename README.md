# Description

Use Docker and Jenkins directly.
- Install Vagrant to create a virtual machine
- On the Vagrant VM:
    - Install Docker to create services (database, web servers,...) for development
    - Develop some applications
    - Install Jenkins for Continuous Integration
    - Combine Docker and Jenkins for Continuous Delivery

# Installation

- Install Vagrant
- Create Vagrant VM: `vagrant up --provision`
- Docker and Jenkins are pre-installed

# Development

- SSH into Vagrant VM: `vagrant ssh`
- Run development server: `cd /vagrant/hello; pipenv run python manage.py runserver`
- To develope with VS Code: search for `Vagrant VS Code remote SSH development`

# Run the app with Docker

- Build the app image: `docker build -t my_hello -f Dockerfile_hello .`
- Run the app in container: `docker run --name my_hello -d -p 8000:8000 my_hello`

# Jenkins

Jenkins comes pre-installed with the Vagrant VM.
JENKINS_URL is at `localhost:8080`.

