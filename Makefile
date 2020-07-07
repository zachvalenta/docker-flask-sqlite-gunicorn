.PHONY: test
name = "flask-sqlite-gunicorn"

help:
	@echo
	@echo "🏡 LOCAL SERVERS"
	@echo
	@echo "flask:       run Flask dev server"
	@echo "guni:        run Flask behind gunicorn"
	@echo
	@echo "🚢 DOCKER"
	@echo
	@echo "build:       build image"
	@echo "rebuild:     rebuild image after stopping/removing containers of same name"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
	@echo "rm:          remove container"
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
# 🏡 LOCAL SERVERS
#

flask:
	poetry run flask run

guni:
	poetry run gunicorn -b 127.0.0.1:5000 app:app

#
# 🚢 DOCKER
#

build:
	docker build -t $(name) .

rebuild: stop rm
	docker build -t $(name) .

start:
	docker run --name $(name) -p 5000:5000 $(name)

stop:
	docker stop $(name)

restart:
	docker start $(name); docker logs $(name) --follow

rm: stop
	docker rm $(name)

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
