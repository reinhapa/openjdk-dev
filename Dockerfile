FROM adoptopenjdk:latest
MAINTAINER Patrick Reinhart <patrick@reini.net>
RUN sed -i 's|# deb-src http://archive.ubuntu.com/ubuntu/ focal-updates universe|deb-src http://archive.ubuntu.com/ubuntu/ focal-updates universe|g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends ksh mercurial git nano && apt-get build-dep -y openjdk-14
RUN curl https://ci.adoptopenjdk.net/job/jtreg/lastSuccessfulBuild/artifact/jtreg-4.2.0-tip.tar.gz | tar -xvz -C /opt
ENV LANG=C JT_HOME=/opt/jtreg PATH="/opt/jtreg/bin:${PATH}" WDIR=/openjdk/reviews
COPY hgrc /root/.hgrc
COPY bash_aliases /root/.bash_aliases
VOLUME /openjdk
WORKDIR /openjdk
CMD /bin/bash