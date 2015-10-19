FROM pingworks/docker-ws-baseimg:0.2
MAINTAINER Christoph Lukas <christoph.lukas@gmx.net>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get install -y apt-mirror apache2 && \
  apt-get clean && \
  mv /etc/apt/mirror.list / && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 22

COPY setup.sh /setup.sh
COPY rc.local /etc/rc.local

VOLUME ["/etc/apt"]
CMD ["/sbin/init"]
