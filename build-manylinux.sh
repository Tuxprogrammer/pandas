#!/bin/bash
#

docker run -e PLAT=manylinux2010_x86_64 -v /home/callicott/work/pandas:/io quay.io/pypa/manylinux2010_x86_64 /io/build-wheels.sh