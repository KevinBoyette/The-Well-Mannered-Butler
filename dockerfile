from jenkins:2.46.3-alpine
user root
run apk add --update \
  python \
  python-dev \
  py-pip \
  build-base \
  && pip install jenkinsapi \
  && rm -rf /var/cache/apk/*

copy /bin/manage_jenkins.py /bin/manage_jenkins.py
copy bin/jenkins-cli.sh /bin/jenkins-cli.sh
copy bin/install_jenkins_plugins.sh /bin/install_jenkins_plugins.sh
run \
  chmod 755 /bin/jenkins-cli.sh \
  && chmod 755 /bin/install_jenkins_plugins.sh \
  && mkdir -p ./plugins \
  && install_jenkins_plugins.sh -d ./plugins -a \
    git@3.3.0 \
    xunit@1.102 \
    checkstyle@3.48 \
    analysis-collector@1.51 \
    ansible@0.6.2
