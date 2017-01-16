#!/bin/sh
function start_gateway() {


}

BASE_DIR=/home/user


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

    start_gateway

    /entrypoint.d/ibgateway-start.sh

    # start_gateway
    /bin/bash /opt/IBController/Scripts/IBController.sh 962 -g --tws-path=/home/user/Jts --tws-settings-path=/home/user/Jts --ibc-path=/opt/IBController --ibc-ini=/home/user/IBController/IBController.ini --user= --pw= --fix-user= --fix-pw= --java-path= --mode=$CONF_TRADING_MODE 2>&1
    # sleep 2
    # ps fauxw

    # cat /opt/IBController/launcher.log
    # tail -f ~/IBController/Logs/*
# tail -f /home/user/Jts/launcher.log

else

    echo "User variables not set for gateway config! (ibgateway-settings.sh)"
    exit 1

fi