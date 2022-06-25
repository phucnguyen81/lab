# Description

An app for learning Jenkins.

# Install python

- Install python and pipenv: `install_python.sh`

# Install the app

- Clone this branch: `git clone --branch hello <repo_url> hello`
- Go to the app directory: `cd hello`
- Start the development server: `pipenv run python manage.py runserver 0.0.0.0:8000`
- Test the endpoint: `curl localhost:8000`

# Jenkinsfile

The Jenkinsfile is for Continuous Integration using Jenkins.

- Configure a Jenkins project with:
    - Pipeline: `Pipeline script from SCM`
    - Repository: this repo
    - Branch: this branch
    - Script Path: Jenkinsfile
- Make a change to this branch and commit
- Wait a bit to verify that the job runs

