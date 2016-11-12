FROM ubuntu:16.04
MAINTAINER Tyler Mulligan <z@xnz.me>

# System Dependencies
RUN apt-get update && \
    apt-get install -y build-essential \
    xserver-xorg-dev \
    x11proto-xf86dri-dev \
    x11proto-xf86dga-dev \
    x11proto-xf86vidmode-dev \
    libxxf86dga-dev \
    libxcb-xf86dri0-dev \
    libxpm-dev \
    libxxf86vm-dev \
    libsdl1.2-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libclalsadrv-dev \
    libasound2-dev \
    libxext-dev \
    libjpeg-turbo8-dev \
    zlib1g-dev \
    supervisor \
    screen \
    python3 \
    python3-pip \
    zip \
    unzip \
    curl \
    wget \
    git

# Xonotic
RUN git clone --depth=1 git://git.xonotic.org/xonotic/xonotic.git /opt/Xonotic

WORKDIR /opt/Xonotic

RUN touch data/xonotic-maps.pk3dir.no && \
    touch data/xonotic-music.pk3dir.no && \
    touch netradiant.no

RUN ./all update -l best && \
    ./all compile && \
    ./all compile -r dedicated

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["./all run dedicated"]

EXPOSE 26000
