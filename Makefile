all: build up 
up:
	@docker-compose up -d

bash:
	@docker exec -it jenkins bash

logs:
	docker logs -f jenkins
build:
	@docker-compose build
nocache:
	@docker-compose build --no-cache

clean:
	@docker stop $(shell docker ps -aq)
	@docker rm $(shell docker ps -aq)
	@docker rmi $(shell docker images -aq)
	docker volume prune
