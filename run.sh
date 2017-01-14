#!/bin/bash

# ENV CONF_API_PORT=4444
# ENV CONF_TRADING_MODE=paper
# ENV CONF_IB_USER=greg2017
# ENV CONF_IB_PASS=alglab111
# ENV CONF_IB_READ_ONLY=no

docker rm -f gateway

docker run -id  -e CONF_VNC_PASS=changeme \
                -e CONF_CONTROLLER_PORT=4440 \
                -e CONF_API_PORT=4100 \
                -e CONF_TRADING_MODE=paper \
                -e CONF_IB_USER=john \
                -e CONF_IB_PASS=doeauto \
                -e CONF_IB_READ_ONLY=no \
                -p 5901:5901 -p 6901:6901 -p 4100:4100 \
                --name gateway \
                appsoa/docker-centos-desktop-ibgateway:testing
