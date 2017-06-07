#!/bin/bash
# Update Plugins (Make sure remote is enabled first)
java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080/ list-plugins | grep ')$' >> ./tmp
cat tmp | sed s/'  '/'\t'/g >> ./tmp2
UPDATE_LIST=$( java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080/ list-plugins | grep ')$' | cut -f 1 -d ' ' | sed ':a;N;$!ba;s/\n/ /g' );
if [ ! -z "${UPDATE_LIST}" ]; then
    echo "Updating ${UPDATE_LIST}"
    java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar  -s http://127.0.0.1:8080/ install-plugin ${UPDATE_LIST};
    java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar  -s http://127.0.0.1:8080/ safe-restart;

else
    echo "Nothing to update"
fi
