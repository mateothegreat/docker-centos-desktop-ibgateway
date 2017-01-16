#!/bin/bash

# /bin/bash /opt/IBController/Scripts/IBController.sh 962 -g --tws-path=/home/user/Jts --tws-settings-path=/home/user/Jts --ibc-path=/opt/IBController --ibc-ini=/home/user/IBController/IBController.ini --user= --pw= --fix-user= --fix-pw= --java-path= --mode=$CONF_TRADING_MODE 2>&1 &

# /opt/IBController/IBControllerGatewayStart.sh

touch /home/user/Jts/launcher.log

/usr/bin/java -cp /home/user/Jts/ibgateway/962/jars/jts4launch-962.jar:/home/user/Jts/ibgateway/962/jars/locales.jar:/home/user/Jts/ibgateway/962/jars/log4j-api-2.5.jar:/home/user/Jts/ibgateway/962/jars/log4j-core-2.5.jar:/home/user/Jts/ibgateway/962/jars/total-2015c.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-962.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-install4j-1.7.jar:/opt/IBController/IBController.jar -Xmx256m ibcontroller.IBGatewayController /home/user/IBController/IBController.ini paper >> /home/user/Jts/console.log