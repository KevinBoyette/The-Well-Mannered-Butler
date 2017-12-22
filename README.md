# Getting Jenkins Up and Running


### Dependencies

* Make
* Docker
* Docker-compose


### Getting Up And Running
* `git clone` the repo
* `cd` into the project
* Run `make` to build the Jenkins docker image
* Navigate to `localhost:8080` to view the Jenkins UI
* Default user/password is `admin/admin`


### Warnings:
* Do not store your username and password as this isn't secure yet
* Set up a Jenkins user of your own if you'd like, but again, passwords are not secure
* TODO Doing a docker restart will wipe your build data away

### Cleaning up
* run `make clean`


### Tips

When a Jenkins instance is starting, use https://jenkins-ip:8080/script to play around with Groovy