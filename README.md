# Description

An app for learning Jenkins.

# Installation

- Install python: `install_python.sh`
- Go to the app's base directory: `cd hello`
- Install app dependencies: `pipenv install --dev`
- Start the development server: `pipenv run python manage.py runserver 0.0.0.0:8000`
- Test the endpoint: `curl localhost:8000`

# Jenkinsfile

The Jenkinsfile is for Continuous Integration using Jenkins.

- Configure a Jenkins project:
    - Build triggers: Poll SCM every minute: `* * * * *`
    - Pipeline: `Pipeline script from SCM`
    - Repository: this repo
    - Branch: this branch
    - Additional behaviors: Clean before check out
    - Script Path: Jenkinsfile
- Make a change to this branch and commit
- Wait a bit to verify that the job has started
