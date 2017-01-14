#!/bin/sh

BASE_DIR=/home/user
env
echo "[containerizing] Applying configuration values to IBController.ini.."

if [ -n "$CONF_IB_USER" ]; then

    echo "[containerizing]  + CONF_CONTROLLER_PORT: $CONF_CONTROLLER_PORT"
    echo "[containerizing]  + CONF_API_PORT: $CONF_API_PORT"
    echo "[containerizing]  + CONF_TRADING_MODE: $CONF_TRADING_MODE"
    echo "[containerizing]  + CONF_IB_USER: $CONF_IB_USER"
    echo "[containerizing]  + CONF_IB_PASS: $CONF_IB_PASS"
    echo "[containerizing]  + CONF_IB_READ_ONLY: $CONF_IB_READ_ONLY"


    sed -i 's/CONF_CONTROLLER_PORT/'"$CONF_CONTROLLER_PORT"'/g' $BASE_DIR/IBController/IBController.ini
    sed -i 's/CONF_API_PORT/'"$CONF_API_PORT"'/g' $BASE_DIR/IBController/IBController.ini
    sed -i 's/CONF_TRADING_MODE/'"$CONF_TRADING_MODE"'/g' $BASE_DIR/IBController/IBController.ini
    sed -i 's/CONF_IB_USER/'"$CONF_IB_USER"'/g' $BASE_DIR/IBController/IBController.ini
    sed -i 's/CONF_IB_PASS/'"$CONF_IB_PASS"'/g' $BASE_DIR/IBController/IBController.ini
    sed -i 's/CONF_IB_READ_ONLY/'"$CONF_IB_READ_ONLY"'/g' $BASE_DIR/IBController/IBController.ini

    echo "***************************************************************************************************"


    /bin/vncserver-ctl.sh
    sleep 3
    echo "***************************************************************************************************"
    echo "/opt/IBController/IBControllerGatewayStart.sh --mode=$CONF_TRADING_MODE"
    echo "***************************************************************************************************"
# /usr/bin/java -cp /home/user/Jts/ibgateway/962/jars/jts4launch-962.jar:/home/user/Jts/ibgateway/962/jars/locales.jar:/home/user/Jts/ibgateway/962/jars/log4j-api-2.5.jar:/home/user/Jts/ibgateway/962/jars/log4j-core-2.5.jar:/home/user/Jts/ibgateway/962/jars/total-2015c.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-962.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-install4j-1.7.jar:/opt/IBController/IBController.jar -Xmx768m ibcontroller.IBGatewayController /home/user/IBController/IBController.ini
    # bash /opt/IBController/IBControllerGatewayStart.sh --mode=$CONF_TRADING_MODE


/bin/bash /opt/IBController/Scripts/IBController.sh 962 -g --tws-path=/home/user/Jts --tws-settings-path=/home/user/Jts --ibc-path=/opt/IBController --ibc-ini=/home/user/IBController/IBController.ini --user= --pw= --fix-user= --fix-pw= --java-path= --mode=$CONF_TRADING_MODE

    echo "***************************************************************************************************"

    sleep 2
    ps fauxw

    cat /opt/IBController/launcher.log
    tail -f ~/IBController/Logs/*

else

    echo "User variables not set for gateway config! (ibgateway-settings.sh)"
    exit 1

fi