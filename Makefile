$(shell echo UID=$(shell id -u) > .env)

ifneq ($(shell docker compose version 2>/dev/null),)
  DOCKER_COMPOSE=docker compose
else
  DOCKER_COMPOSE=docker-compose
endif

# build containers
build:
	$(DOCKER_COMPOSE) -f docker-compose.yml build

# Run development containers
run-dev:
	$(DOCKER_COMPOSE) -f docker-compose.yml up db app

# Run all containers in detached mode
run-dev-d:
	$(DOCKER_COMPOSE) -f docker-compose.yml up -d db app

# Run database in detached mode
run-db:
	$(DOCKER_COMPOSE) -f docker-compose.yml up -d db

# Stop all containers
stop-all:
	$(DOCKER_COMPOSE) -f docker-compose.yml stop

# Removes all containers
remove-all:
	docker rm db app

# Removes db and db's data
remove-db:
	docker rm db && docker volume rm db_data