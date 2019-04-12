FROM adoptopenjdk/openjdk11
MAINTAINER Patrick Reinhart <patrick@reini.net>
RUN apt-get update && apt-get install -y --no-install-recommends ksh mercurial nano && apt-get build-dep -y openjdk-11
RUN curl https://adopt-openjdk.ci.cloudbees.com/job/jtreg/lastSuccessfulBuild/artifact/jtreg-4.2.0-tip.tar.gz | tar -xvz -C /opt
ENV LANG=C JT_HOME=/opt/jtreg PATH="/usr/lib/jvm/java-9-openjdk-amd64/bin:/opt/jtreg/bin:${PATH}" WDIR=/openjdk/reviews
COPY hgrc /root/.hgrc
COPY bash_aliases /root/.bash_aliases
VOLUME /openjdk
WORKDIR /openjdk
CMD /bin/bash
