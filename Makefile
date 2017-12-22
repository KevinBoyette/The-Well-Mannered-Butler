# Awesome Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
all: build up  ## Runs build and up using docker-compose
up: ## Starts Jenkins as a daemon process
	@docker-compose up -d

bash: ## Jump into the jenkins container inside a bash shell
	@docker exec -it jenkins bash

logs: ## Collect logs from the jenkins container
	docker logs -f jenkins
build: ## Builds the Jenkins container 
	@docker-compose build
nocache: ## Builds the Jenkins container without using the cache
	@docker-compose build --no-cache

dev: nocache up ## Used for developing this image. Builds without a cache


clean: ## Remove all docker containers, images, and prune any volumes
	@docker stop $(shell docker ps -aq)
	@docker rm $(shell docker ps -aq)
	@docker rmi $(shell docker images -aq)
	docker volume prune
