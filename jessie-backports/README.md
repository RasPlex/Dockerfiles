# Backport cmake

## Build image

```
docker build -t openpht/jessie-backports .
```

## Build cmake inside image

```
docker run -it openpht/jessie-backports
```

```
cd
dget -x http://http.debian.net/debian/pool/main/c/cmake/cmake_3.5.2-1.dsc
cd cmake-3.5.2
# TODO: remove override_dh_strip from debian/rules
dch --local ~bpo80+ --distribution jessie-backports "Rebuild for jessie-backports."
dpkg-buildpackage -us -uc -d
```
