FROM python:3-alpine
LABEL maintainer Zach Valenta
COPY . /flask-sqlite-gunicorn
WORKDIR /flask-sqlite-gunicorn
RUN python -m pip install -r requirements.txt
CMD flask run --host 0.0.0.0
