COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up:
	@docker compose -f $(COMPOSE_FILE) up -d

# Bring down the services
down:
	@docker compose -f $(COMPOSE_FILE) down

build:
	@docker compose -f $(COMPOSE_FILE) build

# View logs for services
logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

re:
	@docker compose -f $(COMPOSE_FILE) down
	@docker compose -f $(COMPOSE_FILE) up --build -d

clean: down
	@docker system prune --force