from jenkins:2.46.3-alpine
user root
run apk add --update \
  alpine-sdk \
# clang \
#  gtest \
# valgrind \
  python \
  python-dev \
  python3 \
  python3-dev \
  py-pip \
  build-base \
  # Ruby
  ruby \
  ruby-bigdecimal \
  ruby-bundler \
  ca-certificates \
  libressl \
  libressl-dev \
  build-base \
  jq \
  ruby-dev \
  R \
  R-dev \
  ; \

  bundle config git.allow_insecure true; \
  gem install json foreman --no-rdoc --no-ri; \
  gem cleanup; \
  rm -rf /usr/lib/ruby/gems/*/cache/* ;\
  # Pip
  pip install jenkinsapi ;\
  rm -rf /var/cache/apk/* ;

copy /bin /bin/
copy /opt /opt/
copy etc/setup.groovy /var/jenkins_home/init.groovy.d/setup.groovy
run bash /usr/local/bin/install-plugins.sh < /opt/plugins.txt
workdir /var/jenkins_home
