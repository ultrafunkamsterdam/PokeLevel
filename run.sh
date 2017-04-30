#!/usr/bin/env bash
#
#=========*=========*=========*=========*=========*
#	PokeLevel Beta 3 
#	Author : UltrafunkAmsterdam
#	https://www.github.com/UltrafunkAmsterdam
#=========*=========*=========*=========*=========*
#
#	run.sh 

PID=$$
THISPATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $THISPATH

. scriptconfig.conf
. functions.sh

trap ReceivedExit SIGHUP SIGINT SIGTERM EXIT

Init

IsInstalled jq gpw 

#gpw()
#{
#echo "XxXxXx"  ## replace by a string that will be the first part of the username so don't use common words
#}


# TODO : Review before removal
#clear
#echo -e "\n\n"
#Logger start " [ https://github.com/ultrafunkamsterdam ]         "    
#Logger " Total accounts in CSV            : $(NumberTotal)       "
#Logger " Number of available accounts     : $(NumberAvailable)   "
#Logger " Number of not available accounts : $(NumberNotAvailable)"
#Logger " Amount of runtime per account    : $TIME_RUN            "
#echo -e "\n"
#Logger "When accounts become available while the script is running, they will be picked up automatically."
#sleep 7
#Logger "Starting Bots "
#sleep 1
clear

LoopCSV

StopSelf

#end
