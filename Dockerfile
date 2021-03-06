FROM python:3-alpine
LABEL maintainer Zach Valenta
ARG project_name=flask-sqlite-gunicorn
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /$project_name
COPY requirements.txt /$project_name/
RUN python -m pip install -r requirements.txt
COPY . /$project_name
CMD gunicorn -b 0.0.0.0:5000 app:app
