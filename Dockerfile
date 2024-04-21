FROM ubuntu:23.10

MAINTAINER "EtherLys <contact@etherlys.com>"
LABEL description "Dockerized command line tool that will fill your console with Hollywood melodrama technobabble."
LABEL version "1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Paris

RUN \
  apt-get update -qq && \
  apt-get install -qqy tzdata hollywood && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
  dpkg-reconfigure tzdata && \
  updatedb && \
  yes | unminimize

ENTRYPOINT ["hollywood"]
