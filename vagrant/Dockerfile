FROM python:3.8
EXPOSE 8000

COPY hello hello
WORKDIR hello

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "python", "manage.py", "runserver"]
CMD [ "0.0.0.0:8000" ]
