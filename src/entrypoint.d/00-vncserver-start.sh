#!/bin/bash

indent() { sed 's/^/\t/'; }

# /bin/vncserver-ctl.sh
# /opt/IBController/IBControllerGatewayStart.sh &

ps fauxw
vncserver -list

DISPLAY=:6

VNC_PW=algolab2017
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}
NO_VNC_PORT="690"${DISPLAY:1}

(echo $CONF_VNC_PASS && echo $CONF_VNC_PASS) | vncpasswd

##start vncserver and noVNC webclient
# $NO_VNC_HOME/utils/launch.sh --vnc $VNC_IP:$VNC_PORT --listen $NO_VNC_PORT
# vncserver -kill :1 && rm -rfv /tmp/.X* ; echo "remove old vnc locks to be a reattachable container"
# vncserver -kill :1
# rm -rfv /tmp/.X*
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
# startxfce4 &
# sleep 1
# tail -f ~/.vnc/*$DISPLAY.log

ps fauxw
vncserver -list