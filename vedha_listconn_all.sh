#!/bin/sh

#var_PASS=`echo "Rk9SRE1hY2hpbmVAMzkK" | base64 --decode`
var_PASS=`cat /home/hvedhasa/hvedhasa_hdp_pwd.txt | base64 --decode`
var_USER='hvedhasa'
var_OSP='hvedhasaOSProfile'

var_INFACMD_PATH="/apps/Informatica/prod/node15781_bdm_infra/10.4.1/isp/bin/"
var_SDE_PROJECT_PATH="/apps/Informatica/prod/GDIA_SCA_SDE/"
ENV='PRD'
var_GGN="GDIA-SCA-SDE-INFA-PRD"
var_DOM='DOM_BDM_PROD'
var_DIS='DIS_BDM_PROD'

echo "* * * * * * * *Beginning to List Connection available on the PROD Server ${var_USER} "

sh ${var_INFACMD_PATH}infacmd.sh isp listConnections \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-un ${var_USER} \
-pd $var_PASS

RC=`echo $?`

if [ "${RC}" == "0" ];then
echo "* * * * * * * *${var_USER} - SUCCESS  "
else
echo "* * * * * * * * * *"
echo "* * * * * * * *${var_USER} - FAILURE  "
echo "* * * * * * * * * *"
exit 1
fi

