# overview

Bare bones implementation of:

* a Flask app
* talking to a database
* Dockerized

## how to run?

To run as a container, have DockerCE installed and use the `Makefile`:

```sh
# create image
make image

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

# start server
make flask
```

## FYI

* I have another project that focuses on [just Docker and Flask, no database](https://github.com/zachvalenta/docker-flask-skeleton).
* Here are the Docker versions I'm working with:

```sh
$ docker --version  # Docker version 18.09.2, build 6247962
$ docker-compose --version  # docker-compose version 1.23.2, build 1110ad01
$ docker-machine --version  # docker-machine version 0.16.1, build cce350d7
```
