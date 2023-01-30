#####################################################################################
# QA / PROD
#####################################################################################

https://docs.informatica.com/data-engineering/data-engineering-integration/10-2-2/integration-guide/connections/jdbc-connection-properties/sqoop-connection-level-arguments.html
https://docs.informatica.com/data-engineering/data-engineering-integration/10-4-0/user-guide/mappings/sqoop-mappings-in-a-hadoop-environment/configuring-parameters-for-sqoop-arguments-in-the-mapping.html

source /home/ifpxhpam/.bashrc
var_PASS=`cat /apps/Informatica/prod/GDIA_SCA_SDE/securityfiles/sde_hadoop_ifpxhpam.txt | base64 --decode`

var_PASS=`cat /home/hvedhasa/hvedhasa_hdp_pwd.txt | base64 --decode`
var_USER='hvedhasa'
var_OSP='hvedhasaOSProfile'

#QA
var_INFACMD_PATH="/apps/Informatica/qa/node14513_bdm_infra/10.4.1/isp/bin/"
var_SDE_PROJECT_PATH="/apps/Informatica/qa/GDIA_SCA_SDE/"
ENV='QA'
var_GGN="GDIA-SCA-SDE-INFA-QA"
var_DOM='DOM_BDM_QA'
var_DIS='DIS_BDM_QA'
var_USER='ifpxhqam'
var_OSP='ifpxhqamOSProfile'


#PROD
var_PASS=`cat /apps/Informatica/prod/GDIA_SCA_SDE/securityfiles/sde_hadoop_ifpxhpam.txt | base64 --decode`
var_INFACMD_PATH="/apps/Informatica/prod/node15781_bdm_infra/10.4.1/isp/bin/"
var_SDE_PROJECT_PATH="/apps/Informatica/prod/GDIA_SCA_SDE/"
ENV='PRD'
var_GGN="GDIA-SCA-SDE-INFA-PRD"
var_DOM='DOM_BDM_PROD'
var_DIS='DIS_BDM_PROD'
var_USER='ifpxhpam'
var_OSP='ifpxhpamOSProfile'

sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a App_wf_CONSENT_To_CKSA \
-wf wf_CONSENT_MCKSC13_CONSUMER_BRAND_TBL

sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a App_wf_CONSENT_To_CKSA \
-wf wf_CONSENT_MCKSC14_CONSUMER_CAMPAIGN_TBL


ps --no-headers auxwwwm | cut -f1 -d' ' | sort | uniq -c | sort -n
ulimit -a

#####################################################################################
#  L I S T        P L U G I N S
#####################################################################################

sh ${var_INFACMD_PATH}infacmd.sh ListPlugins

#####################################################################################
#  A P P L I C A T I O N
#####################################################################################

#------------------------------------------------------------------------------------
#

#------------------------------------------------------------------------------------

#####################################################################################
# P I N G    T E S T
#####################################################################################
echo "
sh ${var_INFACMD_PATH}infacmd.sh isp ping \
-dn ${var_DOM} \
-sn ${var_DIS} "

var_PASS=`echo "Rk9SRE1hY2hpbmVANDAK" | base64 --decode`
var_USER='hvedhasa'
var_OSP='hvedhasaOSProfile'


sh /apps/Informatica/dev/node12294_bdm_infra/10.4.1/isp/bin/infacmd.sh isp ping -dn DOM_BDM_DEV -sn DIS_BDM_DEV

#####################################################################################
# L I S T    S E R V I C E S ,Misc.
#####################################################################################

sh ${var_INFACMD_PATH}infacmd.sh isp listServices \
-dn ${var_DOM} \
-un ${var_USER} \
-pd $var_PASS \
-sdn 'GDIA SCA SDE'



sh ${var_INFACMD_PATH}infacmd.sh isp listServiceNodes \
-dn ${var_DOM} \
-un ${var_USER} \
-sn ${var_DIS} \
-pd $var_PASS \
-sdn 'GDIA SCA SDE'

sh ${var_INFACMD_PATH}infacmd.sh isp getServiceStatus \
-dn ${var_DOM} \
-un ${var_USER} \
-sn ${var_DIS} \
-pd $var_PASS \
-sdn 'GDIA SCA SDE'



#####################################################################################
# C O N N E C T I O N   D E T A I L S
#####################################################################################

sh ${var_INFACMD_PATH}infacmd.sh isp listConnections \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-un ${var_USER} \
-pd $var_PASS

sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn HADOOP_SDE \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  


sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn HADOOP_SDE_TEST \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

TERADATA_SDE_CON - NA
TERADATA_SDE_CON_FMCC
TERADATA_SDE_CON_FPRCC_UTF8


sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn TERADATA_SDE_CON \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn TERADATA_SDE_CON_wo_Sqoop \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn TERADATA_SDE_CON_QA_wo_Sqoop \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  


sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn HIVE_SDE_CON \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn HBASE_SDE_CON \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

sh ${var_INFACMD_PATH}infacmd.sh isp listConnectionOptions \
-cn HDFS_SDE_CON \
-DomainName ${var_DOM} \
-UserName ${var_USER} \
-Password $var_PASS \
-sdn 'GDIA SCA SDE'  

#####################################################################################
# A P P L I C A T I O N S
#####################################################################################

sh ${var_INFACMD_PATH}infacmd.sh dis ListApplications \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
| sort -u  | grep "a_"

App_wf_DYNAMIC_MAPPING_NA


sh ${var_INFACMD_PATH}infacmd.sh dis stopApplication \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_TERADRTEST

sh ${var_INFACMD_PATH}infacmd.sh dis stopApplication \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_TERADRTEST

sh ${var_INFACMD_PATH}infacmd.sh dis UndeployApplication \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_TERADRTEST

sh ${var_INFACMD_PATH}infacmd.sh dis UndeployApplication \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_DYNAMIC_AUDIT


sh ${var_INFACMD_PATH}infacmd.sh dis listApplicationObjects \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_7810_SDE2_SALES_ATTRIBUTE_CONTROL

#--For other IT folks
#--------------------
sh ${var_INFACMD_PATH}infacmd.sh dis setapplicationpermissions \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-ggn '${var_GGN}' \
-gsdn 'GDIA SCA SDE' \
-a App_wf_CUSTOMER_GID0T01_C_CONSMR_T1_TEMP  \
-ap view execute grant


w_TERADRTEST_R5mZ7R9SEeu1wz9C8Xgcfg_20201105_053301.log

#For Schedulers
#--------------------
sh ${var_INFACMD_PATH}infacmd.sh dis setApplicationPermissions \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${VAR_PASS} \
-sdn GDIA SCA SDE \
-a a_TERADRTEST  \
-gun ${var_USER} \
-gsdn 'GDIA Job Scheduler' \
-ap view execute grant


#####################################################################################
# W O R K F L O W S
#####################################################################################
sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflows \
-sn ${var_DIS} \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-a a_DYNAMIC_AUDIT \
-un ${var_USER} \
-pd ${var_PASS} 



sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a a_DYNAMIC_AUDIT \
-wf w_DYNAMIC_AUDIT

sh ${var_INFACMD_PATH}infacmd.sh wfs startworkflow \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-osp ${var_OSP}\
-a a_DYNAMIC_AUDIT \
-wf w_DYNAMIC_AUDIT \
-pf ${var_SDE_PROJECT_PATH}p_DYNAMIC_AUDIT_01.xml \
-w

sh ${var_INFACMD_PATH}infacmd.sh wfs listActiveWorkflowInstances \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' 

#####################################################################################
# M A P P I N G S
#####################################################################################

sh ${var_INFACMD_PATH}infacmd.sh ms getMappingStatus \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-ji nHC3Gr92EeqlIneY3dlA1A	

sh ${var_INFACMD_PATH}infacmd.sh ms ListMappings \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a a_DYNAMIC_AUDIT
#msdp01_batch_blaze


sh ${var_INFACMD_PATH}infacmd.sh ms listMappingParams \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a Application_m_TERA_TBL_DROP \
-m m_TERA_TBL_DROP 


sh ${var_INFACMD_PATH}infacmd.sh ms listMappingParams \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a Application_m_DYNLD_HIVE_NOCUST \
-m m_DYNLD_HIVE_NOCUST 



--------------------------------------------------------

sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a a_7049_SDE2_FP_CREDITCARD_MART \
-wf w_DYNMS_TERA_VAL_AuditCnt_V1

sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflowParams \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a a_6060_SDE2_CUSTOMER \
-wf w_DYNMS_TERA_VAL_M16

---------------------------------------------------------

sh ${var_INFACMD_PATH}infacmd.sh ms runMapping \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-osp ${var_OSP}\
-sdn 'GDIA SCA SDE' \
-pf ${var_SDE_PROJECT_PATH}p_DYNAMIC_AUDIT_02.xml \
-a a_DYNAMIC_AUDIT \
-m m_DYNAMIC_AUDIT \
-w

#####################################################################################
# C L U S T E R
#####################################################################################
sh ${var_INFACMD_PATH}infacmd.sh cluster listConfigurations \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-un ${var_USER} \
-pd ${var_PASS}

#bdm_qa_new_cc
#####################################################################################
# S A M P L  E
#####################################################################################
sh ${var_INFACMD_PATH}infacmd.sh wfs startworkflow \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-osp ${var_OSP}\
-a a_DYNAMIC_AUDIT \
-wf w_DYNAMIC_AUDIT \
-pf ${var_SDE_PROJECT_PATH}p_DYNAMIC_AUDIT_01.xml \
-w

sh ${var_INFACMD_PATH}infacmd.sh wfs startworkflow \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-osp ${var_OSP}\
-a a_DYNAMIC_AUDIT \
-wf w_DYNAMIC_AUDIT \
-pf ${var_SDE_PROJECT_PATH}p_DYNAMIC_AUDIT_02.xml \
-w

sh ${var_INFACMD_PATH}infacmd.sh wfs startworkflow \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-osp ${var_OSP}\
-a a_DYNAMIC_AUDIT \
-wf w_DYNAMIC_AUDIT \
-pf ${var_SDE_PROJECT_PATH}p_DYNAMIC_AUDIT_03.xml \
-w

kVt7cJ9GEeqYDYkgGRLp7A
sD1dCJ9GEeqYDYkgGRLp7A
xGI5hZ9GEeqYDYkgGRLp7A

#####################################################################################
# RETROFIT
#####################################################################################
  listApplicationObjects: Lists the paths of the objects in an application by type.
  listApplicationOptions: Lists the properties for an application.
listDataObjectOptions

sh ${var_INFACMD_PATH}infacmd.sh dis listApplicationObjects \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-a a_7810_SDE2_SALES_ATTRIBUTE_CONTROL


sh ${var_INFACMD_PATH}infacmd.sh dis listApplicationObjects -sn ${var_DIS} -dn ${var_DOM} -un ${var_USER} -sdn 'GDIA SCA SDE' -pd ${var_PASS} -a a_7810_SDE2_SALES_ATTRIBUTE_CONTROL


sh ${var_INFACMD_PATH}infacmd.sh dis ListApplications \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS}

sh ${var_INFACMD_PATH}infacmd.sh  wfs listWorkflows \
-sn ${var_DIS}  \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-a App_6056_SDE_CONSENT_HADOOP \
-un ${var_USER} \
-pd ${var_PASS}


sh ${var_INFACMD_PATH}infacmd.sh ms ListMappings \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a App_6056_SDE_CONSENT_HADOOP

sh ${var_INFACMD_PATH}infacmd.sh  wfs listWorkflowParams \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a App_6056_SDE_CONSENT_HADOOP \
-wf wf_DYN_CUST_SQL

sh ${var_INFACMD_PATH}infacmd.sh ms listMappingParams \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a App_6056_SDE_CONSENT_HADOOP \
-m m_DYN_CUST_SQL 





Batch01- XsqftJ9XEeqYDYkgGRLp7A
Batch01-test [9YVbkp9XEeqYDYkgGRLp7A]
dp03-[s_t73Z9ZEeqYDYkgGRLp7A]

  getMappingStatus: Get a mapping running status with its Job Id.
  getRequestLog: Writes the mapping log to the specified file.
  listMappingOptions: Lists mapping options.
  listMappingParams: Lists the parameters for a mapping and creates a mapping parameter file that you can use  when you run a mapping.
  listMappings: Lists the mappings in an application.

sh ${var_INFACMD_PATH}infacmd.sh ms listMappingParams


sh ${var_INFACMD_PATH}infacmd.sh ms getMappingStatus \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-ji i9pwt2RNEeutbA4t08h3xQ

TTHhM79zEeqlIneY3dlA1A

sh ${var_INFACMD_PATH}infacmd.sh ms getMappingStatus \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS} \
-ji CgCxEpW4Eeqfc-llIOpvtw	


sh ${var_INFACMD_PATH}infacmd.sh ms listMappingOptions \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-a App_data_refresh \
-m m_data_refresh 


sh ${var_INFACMD_PATH}infacmd.sh dis ListApplications \
-sn ${var_DIS} \
-dn ${var_DOM} \
-un ${var_USER} \
-sdn 'GDIA SCA SDE' \
-pd ${var_PASS}



sh ${var_INFACMD_PATH}infacmd.sh wfs listWorkflows \
-sn ${var_DIS} \
-dn ${var_DOM} \
-sdn 'GDIA SCA SDE' \
-a App_data_refresh \
-un ${var_USER} \
-pd ${var_PASS}


sh ${var_INFACMD_PATH}infacmd.sh ms ListMappings \
-dn ${var_DOM} \
-un ${var_USER} \
-pd ${var_PASS} \
-sdn 'GDIA SCA SDE' \
-sn ${var_DIS} \
-a App_data_refresh



<?xml version="1.0" encoding="UTF-8"?><root xmlns="http://www.informatica.com/Parameterization/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema" version="2.0">
    <!--Specify deployed application specific parameters here.-->
    <!--
    <application name="Application_m_TERA_TBL_DROP">
    <mapping name="m_TERA_TBL_DROP"/>
</application>
-->
    <project name="GDIA_SCA_SDE">
        <folder name="SDE_COMMON">
            <mapping name="m_TERA_TBL_DROP">
                <parameter name="TERA_CONNECTION">TERADATA_SDE_CON</parameter>
                <parameter name="TERA_DATABASE">SDE_NA_PRDDATA</parameter>
                <parameter name="TERA_TABLE">default</parameter>
                <parameter name="UNIX_DIR">/apps/Informatica/prod/GDIA_SCA_SDE/logfiles/</parameter>
                <parameter name="UNIX_FILE">default</parameter>
                <parameter name="CUST_SQL_PRE">create table sde_na_prddata.test1(col1 varchar(10));create table sde_na_prddata.test2(col1 varchar(10));</parameter>
                <parameter name="CUST_SQL_POST">select 'post-sql'</parameter>
            </mapping>
        </folder>
    </project>
</root>


var_PASS=`cat /apps/Informatica/prod/GDIA_SCA_SDE/securityfiles/sde_hadoop_ifpxhpam.txt | base64 --decode`

sh ${var_INFACMD_PATH}infacmd.sh ms runMapping \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un ifpxhpam \
-pd ${var_PASS} \
-osp ifpxhpamOSProfile \
-sdn 'GDIA SCA SDE' \
-pf /apps/Informatica/prod/GDIA_SCA_SDE/paramfiles/teradel_test.xml \
-a Application_m_TERA_TBL_DROP \
-m m_TERA_TBL_DROP \
-rin droptable \
-w


FORDMachine@39

sh ${var_INFACMD_PATH}infacmd.sh dis setapplicationpermissions \
-dn ${var_DOM} \
-sn ${var_DIS} \
-un hvedhasa \
-pd ****** \
-sdn 'GDIA SCA SDE' \
-a Application_m_TERA_TBL_DROP  \
-ggn 'GDIA-SCA-SDE-INFA-QA' \
-gsdn 'GDIA SCA SDE' \
-ap view execute grant

***************************************************************************************************
sh ${var_INFACMD_PATH}infacmd.sh 

as
aud
autotune
bg
ccps
cluster
cms
dis
es
intdq
ipc
isp
mas
mi
mrs
ms
oie
ps
pwx
rest
rms
roh
rtm
sap
sch
search
sql
tools
wfs
ws
xrf


hvedhasa@ito15781:/apps/Informatica/prod/GDIA_SCA_SDE/paramfiles/NASDE/7012_SDE2_CKS_CONSENT_NONFOC> sh ${var_INFACMD_PATH}infacmd.sh wfs listActiveWorkflowInstances
[ICMD_10023] Missing required command option: [<-DomainName|-dn>]
Usage:
        <-DomainName|-dn> domain_name
        <-ServiceName|-sn> service_name
        <-UserName|-un> user_name
        <-Password|-pd> password
        [<-SecurityDomain|-sdn> security_domain]
        [<-ResilienceTimeout|-re> timeout_period_in_seconds]

Lists active workflow instances. An active workflow instance is an instance on which an action can be performed. Lists the state, workflow instance ID, workflow name, and application name for each active workflow instance.


 sh ${var_INFACMD_PATH}infacmd.sh wfs startWorkflow
         <-DomainName|-dn> domain_name
        <-ServiceName|-sn> service_name
        <-UserName|-un> user_name
        <-Password|-pd> password
        [<-SecurityDomain|-sdn> security_domain]
        [<-ResilienceTimeout|-re> timeout_period_in_seconds]
        <-Application|-a> application_name
        <-Workflow|-wf> workflow_name
        [<-Wait|-w> true|false]
        [<-ParameterFile|-pf> parameter_file_path]
        [<-ParameterSet|-ps> parameter_set_name]
        [<-OperatingSystemProfile|-osp> operating_system_profile_name]

sh ${var_INFACMD_PATH}infacmd.sh as listServiceOptions




sh ${var_INFACMD_PATH}infacmd.sh dis
  listApplicationObjectPermissions: Lists permissions for an application object.
  listApplicationObjects: Lists the paths of the objects in an application by type.
  listApplicationOptions: Lists the properties for an application.
  listApplicationPermissions: Lists permissions for an application.
  listDataObjectOptions: Lists the properties for a data object.
  
  
  
  listMappingEngines: Lists mappings with validation and execution environments
[ICMD_10023] Missing required command option: [<-DomainName|-dn>]
Usage:
        <-DomainName|-dn> domain_name
        <-ServiceName|-sn> service_name
        <-UserName|-un> user_name
        <-Password|-pd> password
        [<-SecurityDomain|-sdn> security_domain]
        [<-ResilienceTimeout|-re> timeout_period_in_seconds]

