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
arg_WF=$2


if ( [ "${arg_APP}" == "" ] || [ "${arg_WF}" == "" ] );then
echo "Invalid APPNAME ==> '${arg_APP} ' OR Invalid Workflow Name ==> '${arg_WF} ' "
exit 1
else echo "${var_USER} fetching details for ${arg_APP} and ${arg_WF}  "
fi


sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a ${arg_APP} \
-wf ${arg_WF}

RC=`echo $?`

if [ "${RC}" == "0" ];then
echo "${var_USER} fetching details for ${arg_APP} and ${arg_WF} - SUCCESS "
else
echo "${var_USER} fetching details for ${arg_APP} and ${arg_WF}  - FAILED"
exit 1
fi
