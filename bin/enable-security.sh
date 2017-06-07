#!/bin/bash
sed -i 's/<useSecurity>false<\/useSecurity>/<useSecurity>true<\/useSecurity>/g' \
  /var/jenkins_home/config.xml
sed -i 's/<denyAnonymousReadAccess>false<\/denyAnonymousReadAccess>/<denyAnonymousReadAccess>true<\/denyAnonymousReadAccess>/g' \
    /var/jenkins_home/config.xml
sed -i  's/<enabled>true<\/enabled>/<enabled>false<\/enabled>/g' \
  /var/jenkins_home/jenkins.CLI.xml
