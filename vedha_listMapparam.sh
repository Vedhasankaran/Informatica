#!/bin/sh

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
arg_MAP=$2

if ( [ "${arg_APP}" == "" ] || [ "${arg_MAP}" == "" ] );then
echo "Invalid APPNAME ==> '${arg_APP} ' OR Invalid Mapping Name ==> '${arg_MAP} ' "
exit 1
else echo "${var_USER} fetching details for ${arg_APP} and ${arg_MAP}  "
fi

sh ${var_INFACMD_PATH}infacmd.sh ms listMappingParams \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a ${arg_APP} \
-m ${arg_MAP} 

RC=`echo $?`

if [ "${RC}" == "0" ];then
echo "${var_USER} fetching details for ${arg_APP} and ${arg_MAP} - SUCCESS "
else
echo "${var_USER} fetching details for ${arg_APP} and ${arg_MAP}  - FAILED"
exit 1
fi
