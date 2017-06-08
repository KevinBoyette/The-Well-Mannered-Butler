from jenkins:2.46.3-alpine
user root
run apk add --update \
  alpine-sdk \
  clang \
  gtest \
  valgrind \
  python \
  python-dev \
  py-pip \
  build-base \
  && pip install jenkinsapi \
  && rm -rf /var/cache/apk/*

copy /bin /bin/
run \
  chmod 755 /bin/disable-security.sh \
  && chmod 755 /bin/enable-security.sh \
  && chmod 755 /bin/install_jenkins_plugins.sh \
  && chmod 755 /bin/update-plugins.sh \
  && mkdir -p ./plugins \
  && install_jenkins_plugins.sh -d ./plugins -a \
    git@3.3.0 \
    analysis-core@1.87 \
    xunit@1.102 \
    checkstyle@3.48 \
    warnings@4.62 \
    valgrind@0.27 \
    cppcheck@1.21 \
    analysis-collector@1.51 \
    ansible@0.6.2 \
  && mv ./plugins /var/jenkins_home/
workdir /var/jenkins_home
