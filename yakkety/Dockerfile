FROM ubuntu:yakkety

RUN apt-get update && apt-get install -y \
    locales \
    sudo \
    ca-certificates \
    openssh-client \
    git \
    build-essential \
    cmake \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && /usr/sbin/update-locale LANG=en_US.UTF-8
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
 && locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN adduser --disabled-password --gecos '' docker \
 && adduser docker sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get update && apt-get install -y \
    packaging-dev \
    fakeroot \
    cdbs \
    dh-exec \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libsdl-image1.2-dev \
    libsqlite3-dev \
    liblzo2-dev \
    libfribidi-dev \
    libfontconfig1-dev \
    libyajl-dev \
    libmicrohttpd-dev \
    libssl-dev \
    libtinyxml-dev \
    libglew-dev \
    libavahi-client-dev \
    libxrandr-dev \
    libflac-dev \
    libboost-thread-dev \
    libcurl4-openssl-dev \
    libvorbis-dev \
    libmpeg2-4-dev \
    libass-dev \
    librtmp-dev \
    libplist-dev \
    libva-dev \
    libvdpau-dev \
    libcec-dev \
    libmodplug-dev \
    libiso9660-dev \
    libusb-dev \
    libudev-dev \
    yasm \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

USER docker
