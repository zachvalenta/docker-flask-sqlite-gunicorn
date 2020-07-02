FROM python:3-alpine
LABEL maintainer Zach Valenta
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /flask-sqlite-gunicorn
COPY requirements.txt /flask-sqlite-gunicorn/
RUN python -m pip install -r requirements.txt
COPY . /flask-sqlite-gunicorn
CMD gunicorn -b 0.0.0.0:5000 app:app
