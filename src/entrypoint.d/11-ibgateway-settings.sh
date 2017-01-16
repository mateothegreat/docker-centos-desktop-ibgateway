#!/bin/bash

BASE_DIR=/home/user

if [ -n "$CONF_IB_USER" ]; then

    echo "[containerizing] Applying configuration values to IBController.ini.."
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

else

    echo "User variables not set for gateway config! (ibgateway-settings.sh)"
    exit 1

fi