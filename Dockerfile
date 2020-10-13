FROM python:3.8-slim-buster

WORKDIR /app
ADD requirements.txt .
ADD testapp testapp
RUN pip install -r requirements.txt

ENV PORT 8080

CMD exec gunicorn --bind :$PORT -w 1 --threads 8 --timeout 10 testapp.testapp:server
