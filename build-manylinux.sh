#!/bin/bash
#

docker run --rm -e PLAT=manylinux1_x86_64 -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 /io/build-wheels.sh
ls wheelhouse/
docker run --rm -e PLAT=manylinux1_i686 -v `pwd`:/io quay.io/pypa/manylinux1_i686 linux32 /io/build-wheels.sh
ls wheelhouse/
docker run --rm -e PLAT=manylinux2010_x86_64 -v `pwd`:/io quay.io/pypa/manylinux2010_x86_64 /io/build-wheels.sh
ls wheelhouse/