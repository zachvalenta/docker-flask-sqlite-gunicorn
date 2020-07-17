# overview

Bare bones implementation of:

* a Flask app
* running behind gunicorn
* talking to a database (SQLite)
* Dockerized

## how to run?

To run as a container, have DockerCE installed and use the `Makefile`:

```sh
# create image
make build

# run container using image
make start

# hit healthcheck endpoint
make hc

# stop container
make stop
```

You can also work with the app locally (outside of a container, on your own operating system):

```sh
# install deps
poetry install

# run Flask dev server
make flask

# run Flask behind gunicorn
make guni
```

## FYI

Here's the full list of projects I have in this vein:

* [base: Docker + Flask](https://github.com/zachvalenta/docker-flask)
* [base + config management](https://github.com/zachvalenta/docker-flask-envs-secrets)
* [base + config management + SQLite](https://github.com/zachvalenta/docker-flask-sqlite)
* [base + config management + SQLite + gunicorn](https://github.com/zachvalenta/docker-flask-sqlite-gunicorn-config)
* [base + SQLite](https://github.com/zachvalenta/docker-flask-sqlite)
* [base + SQLite + gunicorn](https://github.com/zachvalenta/docker-flask-sqlite-gunicorn)
* [base + Postgres](https://github.com/zachvalenta/docker-flask-postgres)

Here are the Docker versions I'm working with:

```sh
$ docker --version  # Docker version 18.09.2, build 6247962
$ docker-compose --version  # docker-compose version 1.23.2, build 1110ad01
$ docker-machine --version  # docker-machine version 0.16.1, build cce350d7
```

There are some tricky aspects of working with gunicorn when it comes to Docker that I haven't addressed here; I'd like to keep this repo as straightforward as possible, so it can be used as a baseline for other projects. For info on those tricky aspects, read more [here](https://pythonspeed.com/articles/gunicorn-in-docker/).
