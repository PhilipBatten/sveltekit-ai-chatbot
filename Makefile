default: help

help:
	@echo ""
	@echo "Available environment commands:"
	@echo "    start     			bring up the development environment"
	@echo "    start-prod    		bring up the production like environment"
	@echo "    stop    				down any docker services running"
	@echo ""

start: stop _build _start _finish
start-prod: stop _build _start_prod _finish

stop:
	docker-compose down -v --remove-orphans
	docker network prune -f

_build:
	# docker-compose pull
	# docker-compose build --pull

_start:
	docker-compose run --rm app npm install
	docker-compose up -d app

_start_prod:
	docker-compose up -d app-prod

_finish:
	@echo "----------------------------------------------------------------------------------------------------"
	@echo ""
	@echo "> Environment up at: "
	@echo ""
	@echo "Application	http://localhost:3000"
	@echo ""