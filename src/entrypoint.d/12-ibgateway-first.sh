#!/bin/bash


    PID=$(pidof java)
    IP=$(hostname -I)

    echo "Waiting for authentication before stopping... pid=$PID - ip=$IP"

    touch /home/user/Jts/launcher.log

    sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/launcher.log | { sed "/Authentication completed/ q" && kill $$ ;}'
 sleep 3
   echo STOP | nc $IP 4440

    # while [[ -z $(find /home/user/Jts -name ibg.xml) ]]; do

    #     sleep 1
    #     echo -n "[$(pidof java)] "

    # done
sleep 3

    sh -c 'tail -n +0 --pid=$$ -f /home/user/Jts/*/ibgateway.log | { sed "/Shutdown thread finished/ q" && kill $$ ;}'

sleep 3
ls -la /home/user/Jts/d*
    CONF=$(find /home/user/Jts -name ibg.xml)
    echo "Located saved settings file: $CONF"

# 	<ApiSettings varName="api" dde="false" readOnlyApi="false" allowOnlyLocalhost="true" socketClient="false" autoOpenOrdDonwload="true" port="4100" includeFxPositions="true" includeContinuousUpdateChanges="true" sendMessagesInEnglish="false" sendMessagesTranslated="true" logLevel="2" useNegativeAutoRange="true" overridePrecautionaryConstraints="true" bypassBondWarning="false" bypassYtwWarning="false" bypassCalledBondWarning="false" bypassSameActionPairTradeWarning="false" masterClientID="-1" acceptLargeSize="false" showApiMsg="false" includeMktData="false" createApiMsgLogFile="false" showIBGConsole="false" aPINotAllowedShownAfterDenyAPI="false" slowBufferTimeout="30" syncAccounts="false" multichartNetDoNotShowTime="0" multichartDoNotShowTime="0" verifiedAppPortRangeStart="7000" verifiedAppPortRangeEnd="8000" timeOfVerifiedAppShutdown="0" portOfVerifiedAppShutdown="0"/>

    sed -i 's/overridePrecautionaryConstraints="false"/overridePrecautionaryConstraints="true"/g' $CONF
    sed -i 's/readOnlyApi="true"/readOnlyApi="false"/g' $CONF
    sed -i 's/port="0"/port="4100"/g' $CONF
    sed -i 's/allowOnlyLocalhost="true"/allowOnlyLocalhost="false"/g' $CONF

sleep 3
