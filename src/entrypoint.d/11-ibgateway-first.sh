#!/bin/bash

indent() { sed 's/^/\t/'; }

export DISPLAY=:6
echo "Starting IBControllerGatewayStart.sh.."
    /opt/IBController/IBControllerGatewayStart.sh >> /home/user/Jts/console.log |indent &
    sleep 6
touch /home/user/Jts/launcher.log
stat /home/user/Jts/launcher.log
    PID=$(pidof java)
    IP=$(hostname -I)

    echo "*** Waiting for authentication before stopping... pid=$PID - ip=$IP"
# exit 0
# ps fauxw | indent

    sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/launcher.log | { sed "/Authentication completed/ q" && kill $$ ;}'
    sleep 5

    echo "*** Sending shutdown to controller port.. pid=$PID - ip=$IP"
    # exit 0
    echo STOP | nc $IP 4440
    
    sleep 5
ps fauxw | indent

    sleep 6
    sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/*/ibgateway.log | { sed "/Shutdown thread finished/ q" && kill $$ ;}'

    # CONF=$(find /home/user/Jts -name ibg.xml)
    # echo "Located saved settings file: $CONF"

# 	<ApiSettings varName="api" dde="false" readOnlyApi="false" allowOnlyLocalhost="true" socketClient="false" autoOpenOrdDonwload="true" port="4100" includeFxPositions="true" includeContinuousUpdateChanges="true" sendMessagesInEnglish="false" sendMessagesTranslated="true" logLevel="2" useNegativeAutoRange="true" overridePrecautionaryConstraints="true" bypassBondWarning="false" bypassYtwWarning="false" bypassCalledBondWarning="false" bypassSameActionPairTradeWarning="false" masterClientID="-1" acceptLargeSize="false" showApiMsg="false" includeMktData="false" createApiMsgLogFile="false" showIBGConsole="false" aPINotAllowedShownAfterDenyAPI="false" slowBufferTimeout="30" syncAccounts="false" multichartNetDoNotShowTime="0" multichartDoNotShowTime="0" verifiedAppPortRangeStart="7000" verifiedAppPortRangeEnd="8000" timeOfVerifiedAppShutdown="0" portOfVerifiedAppShutdown="0"/>

    sed -i 's/overridePrecautionaryConstraints="false"/overridePrecautionaryConstraints="true"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/readOnlyApi="true"/readOnlyApi="false"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/port="0"/port="4100"/g' /home/user/Jts/*/ibg*.xml
    sed -i 's/allowOnlyLocalhost="true"/allowOnlyLocalhost="false"/g' /home/user/Jts/*/ibg*.xml

echo "*** Starting again..."
sleep 5
grep readOnly /home/user/Jts/d*/ibg.xml 

/opt/IBController/IBControllerGatewayStart.sh >> /home/user/Jts/console.log | indent