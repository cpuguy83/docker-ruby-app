FROM ubuntu:12.04
# Use bash, no dash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add required apt repos
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> \
  /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ precise universe" >> \
  /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-updates universe" >> \
  /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ precise-updates universe" >> \
  /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y ca-certificates sudo curl git-core

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV RUBY rubinius
ENV RUBY_VERSION 2.2.1

RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c rvm requirements
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN source /usr/local/rvm/scripts/rvm
RUN rvm install $RUBY-$RUBY_VERSION
RUN source /usr/local/rvm/scripts/rvm && rvm use ${RUBY}-${RUBY_VERSION}
RUN echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile
RUN echo "rvm --default use $RUBY-$RUBY_VERSION" >> /etc/profile
RUN locale-gen  en_US.UTF-8
ENV APP_DIR /opt/app
ENV APP_REPO ""
ENV INSTALL_CMD bundle exec rake install
ENV START_CMD bundle exec rake start
RUN rvm ${RUBY}-${RUBY_VERSION} do gem install bundler rake --no-ri --no-rdoc

ADD start.sh /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

CMD ["/usr/local/bin/start"]
