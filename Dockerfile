FROM python:3-alpine
LABEL maintainer Zach Valenta
COPY . /docker-flask-sqlite-skeleton
WORKDIR /docker-flask-sqlite-skeleton
RUN python -m pip install -r requirements.txt
CMD flask run --host 0.0.0.0
