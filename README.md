# Description

A simple Django app to learn Continuous Delivery.

# Installation

- Install development environment: `install.sh`
- Start the development server: `pipenv run python manage.py runserver 0.0.0.0:8000`
- Test the endpoint: `curl localhost:8000`

# Jenkinsfile

The Jenkinsfile is for Continuous Integration using Jenkins.

- Go to Jenkins URL
- Build triggers: Poll SCM every minute: `* * * * *`
- Pipeline: `Pipeline script from SCM`
- Repository: this repo
- Branch: this branch
- Additional behaviors: Clean before check out
- Script Path: Jenkinsfile
- Install Docker on the built-in node
- Create credentials named `docker-hub-credentials` for pushing to Docker Hub
- Try Jenkins `Build Now` and fix what might come up
