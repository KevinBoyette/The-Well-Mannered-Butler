#!/bin/bash

password=$(cat /var/jenkins_home/secrets/initialAdminPassword)
args="$@ --username admin --password ${password}"
java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080/ "${args}"
