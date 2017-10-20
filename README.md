# Development environment

Project can be started in two ways: fully dockerized or partially dockerized with virtualenvwrapper.

_**Warning**: Variables from .env file have higher priority than environment variables. Please note that when you switching between both methods._


## Fully dockerized project

This is the fastest option to launch project. Whole project is built with docker containers.

#### Requirements:

- docker
- docker-compose

To launch the project type this commands:

```bash
$ ./setup-docker.sh
$ docker-compose up -d
```

## Partially dockerized + virtualenvwrapper

This option gives more possibilities, but it also requires more setup at the beginning. All services like PostgreSQL, Redis, Elasticsearch, etc are in Docker containers. Backend is in virtualenv.


#### Requirements:

- docker
- docker-compose
- virtualenv
- virtualenvwrapper
- direnv

To launch the project type this commands:

```bash
$ ./setup-virtualenv.sh
$ workon PROJECT_NAME # Where PROJECT_NAME is your current directory name
$ docker-compose up -d
$ python backend/src/manage.py runserver
```
