#!/usr/bin/env bash
#
# ===============================================
#	PokeLevel beta 1
#	Author : UltrafunkAmsterdam
#	https://www.github.com/UltrafunkAmsterdam
# ==============================================
#
THISPATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $THISPATH

. scriptconfig.conf
. functions.sh

Init
if [ ! $(gpw &>/dev/null) -eq 0 ]; then Logger "error" "GPW is needed for this script to run (to generate usernames) ... " && sleep 2 && Logger "success" "\nInstalling now ... " && sleep 1 && sudo apt install -y gpw ;fi
if [ ! $(jq &>/dev/null) -ge 2 ]; then Logger "error" "JQ is needed for this script to run (to generate usernames) ... "  && sleep 2 && Logger "success" "\nInstalling now ... " && sleep 1 && sudo apt install -y jq ;fi


function Main(){
clear
echo -e "\n\n"
echo -e "\e[103m \e[30m P O K E \e[41m\e[97m L E V E L L E R \e[0m\e[1m B E T A 1 \e[0m \n\n       " 
Logger "compact" " Account : $username                                                             "
Logger "compact" " Location : $LOCATION			                    						       "
Logger "compact" " Team: $TEAM				                        						       "
Logger "compact" " Runtime per account : $TIME_RUN seconds 	         						       "
Logger "compact" " Total accounts : $(cat $ACCOUNTS_FILE | wc -l)	                               "
Logger "compact" " Total accounts available to run : $(cat $ACCOUNTS_FILE | grep -i ",Y" | wc -l)  "
Logger "compact" " Auth : $auth | Username : $username | Password : $password  	                   "												
sleep 3
for i in {00..40}; do echo -n ".";done
clear
sleep 1 
}


LoopCSV

sleep 5
