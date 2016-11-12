FROM debian:latest
MAINTAINER Tyler Mulligan <z@xnz.me>

ENV XONOTIC_DOWNLOAD_URL=http://dl.xonotic.org/xonotic-0.8.1.zip

RUN \
  apt-get update && \
  apt-get install -y zip unzip curl wget git

RUN wget $XONOTIC_DOWNLOAD_URL -q --progress=bar -O /opt/xonotic.zip && \
    unzip /opt/xonotic.zip -d /opt && \
    rm /opt/xonotic.zip && \
    cp /opt/Xonotic/server/server_linux.sh /opt/Xonotic/server_linux.sh

WORKDIR /opt/Xonotic

CMD ["/opt/Xonotic/server_linux.sh"]

EXPOSE 26000
