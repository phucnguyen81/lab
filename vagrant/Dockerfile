FROM python:3.11.0b3-bullseye
EXPOSE 8000

COPY hello hello
WORKDIR hello

RUN pip install --no-cache-dir pipenv
RUN pipenv install

ENTRYPOINT [ "python", "manage.py", "runserver"]
CMD [ "0.0.0.0:8000" ]
