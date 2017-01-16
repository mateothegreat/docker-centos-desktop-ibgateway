#!/bin/bash

    /opt/IBController/IBControllerGatewayStart.sh  &

    sleep 15
    PID=$(pidof java)
    IP=$(hostname -I)

    echo "Waiting for authentication before stopping... pid=$PID - ip=$IP"

    # sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/launcher.log | { sed "/Authentication completed/ q" && kill $$ ;}'
    # sleep 3
    echo STOP | nc $IP 4440
sleep 15
    # sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/*/ibgateway.log | { sed "/Shutdown thread finished/ q" && kill $$ ;}'

    # CONF=$(find /home/user/Jts -name ibg.xml)
    # echo "Located saved settings file: $CONF"

# 	<ApiSettings varName="api" dde="false" readOnlyApi="false" allowOnlyLocalhost="true" socketClient="false" autoOpenOrdDonwload="true" port="4100" includeFxPositions="true" includeContinuousUpdateChanges="true" sendMessagesInEnglish="false" sendMessagesTranslated="true" logLevel="2" useNegativeAutoRange="true" overridePrecautionaryConstraints="true" bypassBondWarning="false" bypassYtwWarning="false" bypassCalledBondWarning="false" bypassSameActionPairTradeWarning="false" masterClientID="-1" acceptLargeSize="false" showApiMsg="false" includeMktData="false" createApiMsgLogFile="false" showIBGConsole="false" aPINotAllowedShownAfterDenyAPI="false" slowBufferTimeout="30" syncAccounts="false" multichartNetDoNotShowTime="0" multichartDoNotShowTime="0" verifiedAppPortRangeStart="7000" verifiedAppPortRangeEnd="8000" timeOfVerifiedAppShutdown="0" portOfVerifiedAppShutdown="0"/>

    sed -i 's/overridePrecautionaryConstraints="false"/overridePrecautionaryConstraints="true"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/readOnlyApi="true"/readOnlyApi="false"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/port="0"/port="4100"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/allowOnlyLocalhost="true"/allowOnlyLocalhost="false"/g' /home/user/Jts/*/ibg*.xml

ps fauxw
echo "Starting again..."
/opt/IBController/IBControllerGatewayStart.sh
# sleep 5
# /usr/bin/java -cp /home/user/Jts/ibgateway/962/jars/jts4launch-962.jar:/home/user/Jts/ibgateway/962/jars/locales.jar:/home/user/Jts/ibgateway/962/jars/log4j-api-2.5.jar:/home/user/Jts/ibgateway/962/jars/log4j-core-2.5.jar:/home/user/Jts/ibgateway/962/jars/total-2015c.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-962.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-install4j-1.7.jar:/opt/IBController/IBController.jar -Xmx128m ibcontroller.IBGatewayController /home/user/IBController/IBController.ini paper

    # /bin/ibgateway-start.sh

    # pkill tail
    # tail -f /home/user/Jts/*/ibgateway.log