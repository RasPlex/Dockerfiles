FROM i386/ubuntu:trusty

RUN apt-get update && apt-get install -y \
    locales \
    sudo \
    ca-certificates \
    openssh-client \
    git \
    build-essential \
    software-properties-common \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:george-edison55/cmake-3.x \
 && apt-get update && apt-get install -y \
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

RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get update && apt-get install -y \
    gcc-4.9 \
    g++-4.9 \
    --no-install-recommends \
 && ln -sf cpp-4.9 /usr/bin/cpp \
 && ln -sf g++-4.9 /usr/bin/g++ \
 && ln -sf gcc-4.9 /usr/bin/gcc \
 && ln -sf gcc-ar-4.9 /usr/bin/gcc-ar \
 && ln -sf gcc-nm-4.9 /usr/bin/gcc-nm \
 && ln -sf gcc-ranlib-4.9 /usr/bin/gcc-ranlib \
 && ln -sf gcov-4.9 /usr/bin/gcov \
 && ln -sf cpp-4.9 /usr/bin/i686-linux-gnu-cpp \
 && ln -sf cpp-4.9 /usr/bin/i686-linux-gnu-cpp-4.9 \
 && ln -sf g++-4.9 /usr/bin/i686-linux-gnu-g++ \
 && ln -sf g++-4.9 /usr/bin/i686-linux-gnu-g++-4.9 \
 && ln -sf gcc-4.9 /usr/bin/i686-linux-gnu-gcc \
 && ln -sf gcc-4.9 /usr/bin/i686-linux-gnu-gcc-4.9 \
 && ln -sf gcc-ar-4.9 /usr/bin/i686-linux-gnu-gcc-ar \
 && ln -sf gcc-ar-4.9 /usr/bin/i686-linux-gnu-gcc-ar-4.9 \
 && ln -sf gcc-nm-4.9 /usr/bin/i686-linux-gnu-gcc-nm \
 && ln -sf gcc-nm-4.9 /usr/bin/i686-linux-gnu-gcc-nm-4.9 \
 && ln -sf gcc-ranlib-4.9 /usr/bin/i686-linux-gnu-gcc-ranlib \
 && ln -sf gcc-ranlib-4.9 /usr/bin/i686-linux-gnu-gcc-ranlib-4.9 \
 && ln -sf gcov-4.9 /usr/bin/i686-linux-gnu-gcov \
 && ln -sf gcov-4.9 /usr/bin/i686-linux-gnu-gcov-4.9 \
 && rm -rf /var/lib/apt/lists/*

USER docker

ENTRYPOINT ["/usr/bin/linux32", "--"]
CMD ["/bin/bash"]
