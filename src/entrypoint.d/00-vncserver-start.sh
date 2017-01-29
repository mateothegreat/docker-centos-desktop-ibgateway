#!/bin/bash

DISPLAY=:6

VNC_PW=algolab2017
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}
NO_VNC_PORT="690"${DISPLAY:1}

(echo $CONF_VNC_PASS && echo $CONF_VNC_PASS) | vncpasswd

vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION

cd /home/user/noVNC
./utils/launch.sh --listen 6906 --vnc 127.0.0.1:5906 &