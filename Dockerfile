FROM ubuntu:16.04
MAINTAINER Patrick Reinhart <patrick@reini.net>
RUN apt-get update
RUN apt-get install -y mercurial openjdk-8-jdk software-properties-common
RUN apt-get build-dep -y openjdk-8-jdk
ENV LANG=C PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin:${PATH}"
VOLUME /openjdk
WORKDIR /openjdk