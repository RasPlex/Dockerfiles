FROM debian:jessie

RUN apt-get update && apt-get install -y \
    locales \
    sudo \
    ca-certificates \
    openssh-client \
    git \
    build-essential \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales \
 && locale-gen C.UTF-8 \
 && /usr/sbin/update-locale LANG=C.UTF-8
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
 && locale-gen
ENV LC_ALL C.UTF-8
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
    debian-keyring \
    devscripts \
    equivs \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    bash-completion \
    libarchive-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libexpat1-dev \
    libncurses5-dev \
    procps \
    python-sphinx \
    libqt4-dev \
    zlib1g-dev \
    libjsoncpp-dev \
    liblzma-dev \
    libdistro-info-perl \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

USER docker
