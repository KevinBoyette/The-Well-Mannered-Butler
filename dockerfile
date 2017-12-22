FROM jenkins/jenkins:2.97-alpine
USER root
ENV GOPATH /go 
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "${GOPATH}/src" "${GOPATH}/bin" && chmod -R 777 "${GOPATH}"
RUN apk add --no-cache --update \
	alpine-sdk \
	python3 \
	python3-dev \
	build-base \
	go \
	ca-certificates \
	libressl \
	libressl-dev \
	build-base \
	jq \
	; \
	rm -rf /var/cache/apk/* ;

COPY /bin /bin/
COPY /opt /opt/
COPY etc/* /var/jenkins_home/init.groovy.d/
RUN bash /usr/local/bin/install-plugins.sh < /opt/plugins.txt
WORKDIR /var/jenkins_home
