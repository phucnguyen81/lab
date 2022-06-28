FROM python:3.11.0b3-bullseye
EXPOSE 8000

COPY hello hello
WORKDIR hello

# Install pipenv
RUN pip install --no-cache-dir pipenv

# Tell pipenv to create venv in the current directory
ENV PIPENV_VENV_IN_PROJECT=1

# Use pipenv to install python dependencies
RUN pipenv install

# Run the development server
ENTRYPOINT [ "pipenv", "run", "python", "manage.py", "runserver"]
CMD [ "0.0.0.0:8000" ]
