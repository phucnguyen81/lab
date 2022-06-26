# Description

Use Docker and Jenkins directly.
- Install Vagrant to create a virtual machine
- On the Vagrant VM:
    - Install Docker to create services (database, web servers,...) for development
    - Develop some applications
    - Install Jenkins for Continuous Integration
    - Combine Docker and Jenkins for Continuous Delivery

# Install jenkins

- Install jenkins: `/vagrant/jenkins/install_jenkins.sh`
- Install jenkins plugins: `/vagrant/jenkins/install_plugins.sh`
- Default jenkins url: `localhost:8080`

# Install python

- Install python and pipenv: `/vagrant/python/install_python.sh`

# Install the app

- Go to the app directory: `cd /vagrant/hello`
- Run development server: `pipenv run python manage.py runserver 0.0.0.0:8000`
- Test the endpoint: `curl localhost:8000`

# Run the app with Docker

- Build the app image: `docker build -t my_hello -f Dockerfile_hello .`
- Run the app in container: `docker run --name my_hello -d -p 8000:8000 my_hello`