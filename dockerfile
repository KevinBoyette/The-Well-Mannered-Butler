from jenkins:2.46.3-alpine
user root
run apk add --update \
  python \
  python-dev \
  py-pip \
  build-base \
  && pip install jenkinsapi \
  && rm -rf /var/cache/apk/*

copy download_plugins.py /bin/download_plugins.py
copy jenkins-cli.sh /bin/jenkins-cli.sh
run chmod 755 /bin/jenkins-cli.sh
