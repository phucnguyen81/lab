# Description

The hello world app for testing CI/CD.

# Install python

- Install python and pipenv: `./install_python.sh`

# Install the app

- Go to the app directory: `cd ./hello`
- Start the development server: `pipenv run python manage.py runserver 0.0.0.0:8000`
- Test the endpoint: `curl localhost:8000`