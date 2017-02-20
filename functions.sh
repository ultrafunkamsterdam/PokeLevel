#!/usr/bin/env bash
#
#=========*=========*=========*=========*=========*
#	PokeLevel beta 1
#	Author : UltrafunkAmsterdam
#	https://www.github.com/UltrafunkAmsterdam
#=========*=========*=========*=========*=========*
#
#	FUNCTIONS.SH

function TimeStamp(){
	 date +%Y-%m-%d\ \%H:%M:%S
}
function DateNow(){
	 date +%Y-%m-%d
}


function Logger(){
	R="\e[0m";B="\e[1m";G="\e[92m";W="\e[39m";E="\e[91m";I="\e[7m"
	[[ -z $1 ]] && echo -e "$B$G [ $R$B$W PGBL$R$B$G | $R$B$W$(TimeStamp)$R$B$G ] $R$B$E Function Logger() : No type of message given as first argument (error or info)$R" #&& exit 1
	[[ -z $2 ]] && echo -e "$B$G [ $R$B$W PGBL$R$B$G | $R$B$W$(TimeStamp)$R$B$G ] $R$B$E Function Logger() : No message given$R" #&& exit 1
	LINE="$B$G[$R$B$W PGBL$R$B$G | $R$B$W $(TimeStamp)$R$B$G ] $R$B$W $2$R"
	[[ ${1^^} == "COMPACT" ]] && LINE="$B$G[$R$B$W PGBL$R$B$G ]$R$B$W $2$R" 
	[[ ${1^^} == "ERROR" ]] && LINE="$B$G[$R$B$W PGBL$R$B$G |$R$B$W $(TimeStamp)$R$B$G ]$R$B$E $2$R" 
	[[ ${1^^} == "SUCCESS" ]] && LINE="$B$G[$R$B$W PGBL$R$B$G |$R$B$W $(TimeStamp)$R$B$G ]$R$B$G $2$R"
	[[ ${1^^} == "INFO" ]] && LINE="$B$G[$R$B$W PGBL$R$B$G |$R$B$W $(TimeStamp)$R$B$G ]$R$B$W $2$R" 
	
	echo -e $LINE #| tee -a $LOGFOLDER/app.log
}

function IsAvailable(){
	[[ ! -z $1 ]] && ACCNAME=$1 || Logger "error" "Function IsAvailable() : Expecting accountname" #&& exit 1
	grep -i $ACCNAME -s $ACCOUNTS_FILE | grep -i ",Y" -s 2>/dev/null
	[[ $? -eq 0 ]] && return 0 || return 1
}

function Init(){
	touch ${THISPATH}/foo 2>/dev/null && rm -f ${THISPATH}/foo || Logger "error" "Folder has incorrect permissions! Please make it writeable by the current user"
}

function GenerateNick(){
	nick=
	nick+=$(gpw | head -n 1)
	nick+=$(shuf -i 0001-9999 -n 1)
	echo $nick
	[[ $? -eq 0 ]] && return 0 || return 1
}

function CreateConfig(){

	[[ -z $1 ]] && Logger "error" "Function CreateConfig() : Expecting accountname" && return 1
	username=$1
	Logger "compact" "CreateConfig() : Creating configuration file for $username (team: $TEAM) in $POGOBOT_CONFIGFOLDER/$username/$username.json"
	[[ ${TEAM^^} == "YELLOW" ]] && TEAM="3"
	[[ ${TEAM^^} == "RED" ]] && TEAM="2"
	[[ ${TEAM^^} == "BLUE" ]] && TEAM="1"
	[[ -d $POGOBOT_CONFIGFOLDER/$username/$username.json ]] && POGOBOT_CONFIGFILE=$POGOBOT_CONFIGFOLDER/$username/$username.json && return 0 
	[[ ! -d $POGOBOT_CONFIGFOLDER/$username ]] && mkdir $POGOBOT_CONFIGFOLDER/$username
	cat $POGOBOT_BASE_CONFIGFILE | jq .tasks[5].config.nickname="\"$(GenerateNick)\"" |  jq .tasks[5].config.team="$TEAM" > $POGOBOT_CONFIGFOLDER/tmpcnf.json && mv $POGOBOT_CONFIGFOLDER/tmpcnf.json $POGOBOT_CONFIGFOLDER/$username/$username.json
	[[ $? -eq 0 ]] && return 0 || return 1
}

function CreateAuthConfig(){
	[[ -z $1 ]] && Logger "error" "Function CreateAuthConfig() : Expecting accountname" && return 1
	username=$1
	Logger "compact" "CreateAuthConfig() : Creating Auth configuration file for $username in $POGOBOT_CONFIGFOLDER/$username/$username.auth.json"
	[[ -f $POGOBOT_CONFIGFOLDER/$username/$username.auth.json ]] && POGOBOT_AUTHCONFIGFILE=$POGOBOT_CONFIGFOLDER/$username/$username.json && return 0 
	cat $POGOBOT_BASE_AUTHCONFIGFILE | jq .auth_service="\"$auth\"" |  jq .username="\"$username\"" | jq .password="\"$password\"" | jq .location="\"$LOCATION\"" | jq .gmapkey="\"$GMAPS_KEY\"" | jq .hashkey="\"$HASH_KEY\"" > $POGOBOT_CONFIGFOLDER/tmpauthcnf.json && mv $POGOBOT_CONFIGFOLDER/tmpauthcnf.json $POGOBOT_CONFIGFOLDER/$username/$username.auth.json && POGOBOT_AUTHCONFIGFILE="$POGOBOT_CONFIGFOLDER/$username/$username.json"
	[[ $? -eq 0 ]] && return 0 || return 1
}


function GetAccount(){
	[[ -z $1 ]] && Logger "error" "function GetAccount() : No accountname given" && return 1
	while IFS=, read a b c d 
	do	
		sed -i '/'"$b"'/c\'"$a"','"$b"','"$c"',N' $ACCOUNTS_FILE
		auth=$a
		username=$b
		password=$c
	done <<< "$(IsAvailable $1)"
	[[ $? -eq 0 ]] && Logger "compact" "Account $1 is going for a run. Set availability to N (no)" && return 0 || return 1
}

function ReturnAccount(){
	[[ -z $1 ]] && Logger "error" "function ReturnAccount() : No accountname given"
	clear
	echo -e "\e[103m \e[30m P O K E \e[41m\e[97m L E V E L L E R \e[0m\e[1m B E T A 1 \e[0m \n\n"
	Logger "Success" "Account $username is finished his $TIME_RUN seconds\nPutting back in CSV as available (Y)\n\nThis is the achievement:" ## && exit 1
	echo -n "$i -> " && echo -n $( cat log/$(ls -1 log | grep -Ei $i) | grep -io 'level.*next.*total' ) && echo -e "\n"
	
	sed -i '/'"$b"'/c\'"$a"','"$b"','"$c"',Y' $ACCOUNTS_FILE && exitcode=$?
	sleep 3
	Logger "info" "Returning account $1 to CSV and marked Available."
	[[ $exitcode -eq 0 ]] && return 0 || return 1
}

function StartBot(){
	cd $POGOBOT_PATH
	. bin/activate
	touch "$LOGFOLDER/$(DateNow)-$username.log"
	python ./pokecli.py -af "$POGOBOT_CONFIGFOLDER/$username/$username.auth.json" -cf "$POGOBOT_CONFIGFOLDER/$username/$username.json" 2>&1 | tee -a "$LOGFOLDER/$(DateNow)-$username.log" &
	sleep $TIME_RUN && pkill -2 -f pokecli.py && Logger "success" "Account $username went through the botting session. Putting back in list now" && sleep 5
	return 0
}

function LoopCSV(){
	declare -a ACCOUNTS=()
	auth= && username= && password= && available=
	IFS=$'\n'
	for x in $(cat $ACCOUNTS_FILE | grep -i ",Y")
	do 
	   IFS=, read a b c d <<< "$x"
	   auth=$a && username=$b && password=$c && available=$d
	   Main && GetAccount $username && CreateConfig $username && CreateAuthConfig $username && StartBot && ReturnAccount $username
	   ACCOUNTS+=("$username")
	done
	
	#Logger "Success" "Finished! Here a quick overview of your accounts level"
	
	#for i in "${ACCOUNTS[@]}"
	#do
	#ReturnAccount $i
	#echo -n "$i -> " && echo -n $( cat log/$(ls -1 log | grep -Ei $i) | grep -io 'level.*next.*total' ) && echo -e "\n"
	#sleep 1
	#done
	
	#[[ $? -eq 0 ]] && return 0 || return 1
	
	
	
}


