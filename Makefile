all:
	docker-compose up -d
password:
	docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
	# docker exec -it jenkins disable-security.sh
	# docker exec -it jenkins install_jenkins_plugins.sh
	# docker exec -it jenkins enable-security.sh
logs: 
	docker logs -f jenkins
build:
	docker-compose build --no-cache

clean:
	docker stop $(shell docker ps -aq)
	docker rm $(shell docker ps -aq)
	docker rmi $(shell docker images -aq)
	docker volume prune
