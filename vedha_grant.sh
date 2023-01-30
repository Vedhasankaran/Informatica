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


arg_APP=$1


if [ "${arg_APP}" == "" ];then 

echo "Invalid APPNAME ==> '${arg_APP} ' " 
exit 1
else echo "${var_USER} started granting permission on ${arg_APP} " 
fi



sh ${var_INFACMD_PATH}infacmd.sh dis setapplicationpermissions \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-ggn 'GDIA-SCA-SDE-INFA-PRD' \
-gsdn 'GDIA SCA SDE' \
-a ${arg_APP}  \
-ap view execute grant


RC=`echo $?`

if [ "${RC}" == "0" ];then 
echo "${var_USER} Granted permission on ${arg_APP} - SUCCESS " 
else 
echo "${var_USER} Granted permission on ${arg_APP} - FAILED"
exit 1
fi

