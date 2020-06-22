.PHONY: test
name = "docker-flask-sqlite-skeleton"

help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "flask:       start app"
	@echo
	@echo "🚢 DOCKER"
	@echo
	@echo "image:       build image"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
	@echo
	@echo "📡 API"
	@echo
	@echo "hc:          healthcheck"
	@echo "get:         get all things"
	@echo "post:        create one thing"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "export:      export Poetry dependencies to requirements.txt"
	@echo "env:         show environment info"
	@echo "deps:        list prod dependencies"
	@echo

#
# 🍶 FLASK
#

flask:
	poetry run flask run

#
# 🚢 DOCKER
#

image:
	docker build -t $(name) .

start:
	docker run --name $(name) -p 5000:5000 $(name)

stop:
	docker stop $(name); docker ps -a

restart:
	docker restart $(name); docker ps

#
# 📡 API
#

hc:
	http http://localhost:5000/healthcheck

get:
	http http://localhost:5000/get-things

post:
	http POST http://localhost:5000/post-thing name=my_new_thing

export:
	poetry export -f requirements.txt > requirements.txt

#
# 📦 DEPENDENCIES
#

env:
	poetry env info

deps:
	poetry show --tree --no-dev
