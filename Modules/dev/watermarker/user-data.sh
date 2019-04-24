#!/bin/bash
# ----------------------------------------------------------------------
#  File     : ScriptToInvokeAutoregisterwithzabbixindev.sh
#  Author   : Madan kumar Thogata (madankumar.t@hp.com)
#  Created  : Thu May 15 08:32:46 UTC 2015
#  Abstract : This script is used to get the details of the nodes from the AWS console for the given Stack except database
#
#  (C) Copyright 2015 Hewlett-Packard Development Company, L.P.
#  All rights reserved.
#
set -x

echo "Downloading required script from lpp repo "

autosclaescriptname=reveal-autoscale-instance-launch-script.sh
now=`date +"%m_%d_%Y"`
LOG_PATH=`pwd`
LOG_FILENAME=$LOG_PATH/"Autoscale_instance_launch_script"$now".log"
service_name="watermark"
env_name="dev"


wget -q https://repo.livepaperapi.com/avatar/webapps/$autosclaescriptname -O $autosclaescriptname

if [ $? -eq 0 ];then

        echo "$autosclaescriptname file downloaded from repo successfully " 2>&1 | tee -a $LOG_FILENAME

else
        echo " Unable to download $autosclaescriptname "  2>&1 | tee -a $LOG_FILENAME
        exit 1
fi

chmod +x $LOG_PATH/$autosclaescriptname

echo "Executing the $autosclaescriptname"
sudo su
$LOG_PATH/$autosclaescriptname $service_name $env_name

if [ $? -eq 0 ];then

        echo "Script execution successful "

else

        echo " Script execution failed"

fi
################################## END OF THE SCRIPT #####################################
