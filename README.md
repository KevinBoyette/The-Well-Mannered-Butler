# Getting Jenkins Up and Running

* Install Make on your system. 
* Run `make` to build the Jenkins docker image. 
* Run `make logs` and wait until Jenkins is up
* Run `make password` Take the output and paste it into the field located at `localhost:8080`.  This is the randomly generated admin password.  
```
$ make password       *[master]
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

eb054599c3c344fd9a8dd8fa6ba8b130 <- password
```
* Set up a Jenkins user if you'd like. 
* Install Plugins and create a pipeline listening on your Github account.  

* To cleanup, run `make clean`

