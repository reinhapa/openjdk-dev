FROM ubuntu:16.04
MAINTAINER Patrick Reinhart <patrick@reini.net>
RUN apt-get update
RUN apt-get install -y curl default-jdk ksh mercurial openjdk-8-jdk software-properties-common
RUN apt-get build-dep -y openjdk-8-jdk
RUN curl https://adopt-openjdk.ci.cloudbees.com/job/jtreg/lastSuccessfulBuild/artifact/jtreg-4.2-b03.tar.gz | tar -xvz -C /opt
ENV LANG=C JT_HOME=/opt/jtreg PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin:/opt/jtreg/bin:${PATH}" ALT_OUTPUTDIR=/openjdk
VOLUME /openjdk
WORKDIR /openjdk