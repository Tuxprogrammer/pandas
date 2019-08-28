#!/bin/bash
set -e -x

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" install -r /io/dev-requirements.txt &
done
wait
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" wheel /io/ -w wheelhouse/ &
done
wait

ls wheelhouse

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" --plat $PLAT -w /io/wheelhouse/
done

ls /io/wheelhouse

# Install packages and test
for PYBIN in /opt/python/*/bin/; do
    "${PYBIN}/pip" install pandas27 --no-index -f /io/wheelhouse
done
