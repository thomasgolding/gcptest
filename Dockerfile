FROM python:3.8-slim-buster

WORKDIR /app
ADD requirements.txt .
ADD testapp testapp
RUN pip install -r requirements.txt
EXPOSE 8080
CMD exec gunicorn --bind :8080 testapp.testapp:server
