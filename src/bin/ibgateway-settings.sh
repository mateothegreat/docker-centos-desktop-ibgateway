#!/bin/sh
function start_gateway() {

    echo "[containerizing]  Starting IBGateway Server.."

    /bin/bash /opt/IBController/Scripts/IBController.sh 962 -g --tws-path=/home/user/Jts --tws-settings-path=/home/user/Jts --ibc-path=/opt/IBController --ibc-ini=/home/user/IBController/IBController.ini --user= --pw= --fix-user= --fix-pw= --java-path= --mode=$CONF_TRADING_MODE

}

BASE_DIR=/home/user


echo "[containerizing] Applying configuration values to IBController.ini.."

if [ -n "$CONF_IB_USER" ]; then

    echo " Starting vncserver.."
    /bin/vncserver-ctl.sh

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

    PID=$(pidof java)
    IP=$(hostname -I)
    echo STOP | nc $IP 4440
    wait $PID

    CONF=$(find /home/user/Jts -name ibg.xml)

    sed -i 's/overridePrecautionaryConstraints="false"/overridePrecautionaryConstraints="true"/g' $CONF
    sed -i 's/readOnlyApi="true"/readOnlyApi="false"/g' $CONF

    start_gateway

    # sleep 2
    # ps fauxw

    # cat /opt/IBController/launcher.log
    # tail -f ~/IBController/Logs/*

else

    echo "User variables not set for gateway config! (ibgateway-settings.sh)"
    exit 1

fi