#!/usr/bin/env bash
#
#=========*=========*=========*=========*=========*
#	PokeLevel beta 3
#	Author : UltrafunkAmsterdam
#	https://www.github.com/UltrafunkAmsterdam
#=========*=========*=========*=========*=========*
#
#	install.sh


PID=$$
THISPATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${THISPATH}"

. scriptconfig.conf
. functions.sh

clear
echo -e "\n\n"
Logger start " [ SETUP PokemonGo-Bot for PokeLevel ] " 
echo -e "\n"
Logger info "Setting permissions for PokeLevel"
chmod -R 775 . > /dev/null
echo -e "\n"
Logger "PokeLevel will install PokemonGo-Bot from https://github.com/PokemonGoF/PokemonGo-Bot"
Logger "Recommended setup will be installing to $THISPATH/PokemonGo-Bot, so PokeLevel needs a minimum of configuration adjustments" 
Logger "In case you definitely want another installation folder, you need to \
correctly modify scriptconfig.conf and make sure you have non-sudo/root access to the folder"

echo -e "${BIWhi} \n"
read -p 'Installation folder | just press enter for default (recommended) :' INSTALLDIR
echo -e "${Re} \n"
clear

[[ ! -z "$INSTALLDIR" ]] && mkdir -f $INSTALLDIR || INSTALLDIR=$THISPATH/PokemonGo-Bot ; 
Logger "starting installation" 
echo -e "${BIWhi} \n"
git clone --recursive https://github.com/PokemonGoF/PokemonGo-Bot.git $INSTALLDIR ; RV=$?
[[ $RV -eq 0 ]] || Logger error "Something went wrong installing, error code $RV"

sed -i 's/^Pokebotauth//g' $INSTALLDIR/setup.sh
sed -i 's/^Pokebotconfig//g' $INSTALLDIR/setup.sh
echo -e "${Re} \n"

clear
echo -e "\n\n"
Logger start " [ SETUP PokemonGo-Bot for PokeLevel ] " 
echo -e "\n"
Logger "We will now start the setup of PokemonGo-Bot. Please follow any occasional instructions from their installer"
sleep 3
cd $INSTALLDIR
./setup.sh -i
mv -f $INSTALLDIR/pokemongo_bot/cell_workers/buddy_pokemon.py $INSTALLDIR/pokemongo_bot/cell_workers/buddy_pokemon.py.bak
cp -f $POGOBOT_CONFIGFOLDER/base/buddy_pokemon.py $POGOBOT_PATH/pokemongo_bot/cell_workers/buddy_pokemon.py
clear
Logger start " [ SETUP PokemonGo-Bot for PokeLevel ] " 
Logger success "PokemonGo-Bot is installed"
Logger "next step:"
Logger "Modify PokeLevel's scriptconfig.conf file and build the accountsfile.csv (both are in the PokeLevel folder) "
echo -e "\n"
sleep 3
Logger "Happy Levelling"
sleep 6 && exit 0
