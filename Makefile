DC = docker compose -f docker-compose.yml
DCO = docker compose -f docker-compose.yml -f docker-compose.override.yml

.PHONY: up prod dev obs override down logs clean ps help

help:
	@echo "Docsy Docker Compose Commands"
	@echo "make up - Start base services"
	@echo "make prod - Start production profile"
	@echo "make dev - Start development profile"
	@echo "make obs - Start observability profile"
	@echo "make override - Start with override configuration"
	@echo "make logs - Follow container logs"
	@echo "make ps - Show container status"
	@echo "make down - Stop all services"
	@echo "make clean - Remove containers and volumes"

up:
	$(DC) up -d --build

prod:
	$(DC) --profile prod up -d --build

dev:
	$(DC) --profile dev up -d --build

obs:
	$(DC) --profile obs up -d --build

override:
	$(DCO) up -d --build

logs:
	$(DC) logs -f --tail=100

ps:
	$(DC) ps -a

down:
	$(DCO) --profile "*" down --remove-orphans

clean:
	$(DCO) --profile "*" down -v --remove-orphans
