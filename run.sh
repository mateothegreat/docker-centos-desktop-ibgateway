#!/bin/bash

# ENV CONF_API_PORT=4444
# ENV CONF_TRADING_MODE=paper
# ENV CONF_IB_USER=greg2017
# ENV CONF_IB_PASS=alglab111
# ENV CONF_IB_READ_ONLY=no

docker rm -f gateway
VERSION=$1
docker run -id  -e CONF_VNC_PASS=changeme \
                -e CONF_CONTROLLER_PORT=4440 \
                -e CONF_API_PORT=4100 \
                -e CONF_TRADING_MODE=paper \
                -e CONF_IB_USER=alglab333 \
                -e CONF_IB_PASS=greg2017 \
                -e CONF_IB_READ_ONLY=no \
                -p 5902:5901 -p 6901:6901 -p 4100:4100 -p 4440:4440 \
                --name gateway \
                gcr.io/virtualmachines-154415/docker-centos-desktop-ibgateway:$VERSION
