# Dockerfiles for OpenPHT

This repository contains Dockerfiles used for building OpenPHT on various linux distributions.

## Build image

```
docker build -t openpht/xenial xenial
```

## Build OpenPHT inside image

```
docker run -it openpht/xenial
```

```
cd
git clone --branch openpht-1.9 --depth 1 https://github.com/RasPlex/OpenPHT.git OpenPHT
mkdir -p OpenPHT/build && cd OpenPHT/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/openpht \
      -DUSE_INTERNAL_FFMPEG=ON -DENABLE_SHAIRPLAY=OFF ..
make -j $(nproc)
```

## Jenkins build job

Use *Build inside a Docker container* from the *CloudBees Docker Custom Build Environment Plugin*

```
cd
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone --branch openpht-1.6 --depth 1 git@github.com:RasPlex/OpenPHT.git OpenPHT
cp -r $WORKSPACE/debian OpenPHT/
cd OpenPHT
# patch -p1 < $WORKSPACE/patches/plexht-0001-cec-update-to-libcec-4.patch
# patch -p1 < $WORKSPACE/patches/plexht-0002-websocketpp-openssl.patch
DEB_BUILD_PARALLEL=1 DEB_BUILD_OPTIONS=parallel=$(nproc) fakeroot debian/rules binary
cp ../*.deb $WORKSPACE
```
