#!/bin/bash
sed -i 's/<useSecurity>true<\/useSecurity>/<useSecurity>false<\/useSecurity>/g' \
  /var/jenkins_home/config.xml
sed -i 's/<denyAnonymousReadAccess>true<\/denyAnonymousReadAccess>/<denyAnonymousReadAccess>false<\/denyAnonymousReadAccess>/g' \
    /var/jenkins_home/config.xml
sed -i  's/<enabled>false<\/enabled>/<enabled>true<\/enabled>/g' \
  /var/jenkins_home/jenkins.CLI.xml
