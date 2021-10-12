#!/bin/bash
author_name="# Mehedi Hasan"
version="# 1.0"
modified="# Modified_11102021_16_34AM"

#########Version Edits##############
# Signaling Jar Update


#Variable declaration
LOGFILE="/usr/local/src/jar_update.log"
jar_location="/tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM"
signaling_loc="/usr/local/iTelSwitchPlusSignalingIM"


#No Colors
			NC='\033[0m'              # Text Reset/No Color
# Regular Colors
			Black='\033[0;100m'       # Black
			Red='\033[0;31m'          # Red
			Green='\033[0;32m'        # Green
			# Bold
			BBlack='\033[1;100m'      # Black
			BRed='\033[1;31m'         # Red
			BGreen='\033[1;32m'       # Green
			
#function for check signaling service status


fn_signaling_status(){
	statussignaling="$(cat $signaling_loc/iTelSwitchPlusSignaling.log | grep -w "started successfully")" 
	if [ ! -z "${statussignaling}" ]
			then
			echo -e "# ${Green}  Signaling  : Started Successfully                         \033[34m#";
	else
			echo -e "# ${BRed}  Signaling  : Failed                         \033[34m#";
	fi
}

#function to start signaling service			
fn_start_signaling(){
	echo -e "# ${Green}  Signaling  : going to start                         \033[34m#";
	cd $signaling_loc
	service iTelSwitchPlusSignalingIM start > /dev/null 2>&1
	sleep 40;
	fn_signaling_status;
}

#function to update signaling jar version
fn_jar_update(){
	echo -e "# ${Green}  Signaling  : new jar update                         \033[34m#";
        cd $signaling_loc
        mv iTelSwitchPlusSignaling.jar iTelSwitchPlusSignaling.jar_$(date '+%Y-%m-%d_%H:%M:%S') > /dev/null 2>&1
	cd $jar_location
	cp -r iTelSwitchPlusSignaling.jar $signaling_loc
	fn_start_signaling;
}

#function to stop signaling
fn_stop_signaling(){
        process_id=$(/bin/ps -fu $USER| grep "iTelSwitchPlusSignaling.jar" | grep -v "grep" | awk '{print $2}')
        if [ -z $process_id ];then
                process_id=$(pgrep -f "iTelSwitchPlusSignaling.jar")
        fi
        if [ ! -z $process_id ];then
                if [ $process_id -gt 0 ];then
						echo -e "# ${Green}  Signaling  : going to stop                         \033[34m#";
						cd $signaling_loc 
                        service iTelSwitchPlusSignalingIM stop > /dev/null 2>&1
                        sleep 10
                        kill -9 $process_id > /dev/null 2>&1
                        pkill -f "iTelSwitchPlusSignaling.jar" > /dev/null 2>&1
						mv iTelSwitchPlusSignaling.log iTelSwitchPlusSignaling.log_$(date '+%Y-%m-%d_%H:%M:%S') > /dev/null 2>&1
                        
                fi
        fi
		
	fn_jar_update;
    
}

fn_stop_signaling;