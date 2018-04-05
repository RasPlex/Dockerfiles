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

### Parameters
- `DOCKER_IMAGE`: distribution
- `OPENPHT_BRANCH`: branch to checkout
- `BUILD_NUMBER`: build number

### Build
Execute shell
```
#!/bin/bash
cd
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone --branch $OPENPHT_BRANCH --depth 1 git@github.com:RasPlex/OpenPHT.git OpenPHT
cp -r $WORKSPACE/debian OpenPHT/
cd OpenPHT
if [ "$DOCKER_IMAGE" = "stretch" -o "$DOCKER_IMAGE" = "bionic" ]; then
  patch -p1 < $WORKSPACE/patches/plexht-0001-cec-update-to-libcec-4.patch # libcec>=4
  patch -p1 < $WORKSPACE/patches/plexht-0002-websocketpp-openssl.patch # openssl>=1.1
fi
OPENPHT_VERSION_PREFIX=$(cat CMakeLists.txt|awk '/VERSION_MAJOR |VERSION_MINOR |VERSION_PATCH / {gsub(/\)/,""); printf $2"."}  END {print ""}'|sed 's/.$//g')
OPENPHT_VERSION="${OPENPHT_VERSION_PREFIX}.${BUILD_NUMBER}+$(git rev-parse --short=8 HEAD)"
DEBFULLNAME="Team RasPlex" DEBEMAIL=linux@rasplex.com dch --newversion ${OPENPHT_VERSION}~${DOCKER_IMAGE} --distribution $DOCKER_IMAGE --force-distribution "new upstream release"
DEB_BUILD_PARALLEL=1 DEB_BUILD_OPTIONS=parallel=$(nproc) fakeroot debian/rules binary
cp ../*.deb $WORKSPACE
cd $WORKSPACE
for f in *.deb; do mv -v "$f" "$(echo $f | tr '[\+\~]' '[\-\-]')"; done
```
