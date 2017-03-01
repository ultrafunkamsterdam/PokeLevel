# **PokeLevel beta 3 - Quickly and recursively level your (new) Pogo accounts**  #
## completes tutorial (nick, outfit, starter), assigns nickname, picks buddy and levels up to level 3 in 90 seconds ##
## For existing accounts: useful for map accounts to run at night, or rotate between map and PokeLevel ##
## At level 5, chooses team ##

## easy installation: ##
### git clone https://github.com/ultrafunkamsterdam/PokeLevel.git  ###
### cd PokeLevel ###
### ./install.sh ###

> ### CHANGELOG: ###
> 1. Fixed buddy issue. Tested new accounts --> level 4 in 300 seconds. level 2 in < 120 seconds.
> 2. Cleaner and better Interface/typography
> 3. Support for ctrl+c. Script will return any running accounts and shuts down correctly.
> 4. Checks for encountered Captcha's or "Busy/Offline servers", writes a log, and proceeds to the next account immediately.
> 5. Support for second HASH key
> 6. Checks for available accounts PER round instead of one time on start, so you can make accounts available by hand live and they will > 7. be picked up again. Also useful if you run multiple instances of the script. (  :):):)  )
> 8. Script stops when there are no available accounts left.
> 9. Some stuff i forgot

## Level up your accounts 1 by 1 from a CSV by a given 'run' time per account ##

Script will generate nickname, outfit and starter Pokemon and will join a team at level 5.

Each account in your CSV will run for (let's say) 300 seconds to complete tutorials, catch pokemon and loot pokestops.
Perfect for fresh accounts to level up so they can be used in maps.
Perfect to schedule at night, to give your mapping-slaves a more 'human-like' behaviour.

All runs will be logged in a folder per account, and each account get's a json config, cache and log.

## Installation ##

`git clone --recursive https://github.com/ultrafunkamsterdam/PokeLevel.git`
`./install.sh`
modify scriptconfig.conf to your needs:
`Add GMAPS-KEY, 1 or 2 PokeHash keys, location, preferred team and ofcourse: time to run per account`
and add your accounts to accountsfile.csv in the form:
`auth,username,password,Y`
to run:
`./run.sh`


# CONFIG SETTINGS #
### Accounts file = accountsfile.csv  in the form : auth,username,password,Y
Y = available, N = not available. 
So perfect for a map/bot combo to skip accounts that are currently working in a map environment -> (N)ot available. When the account is selected by the script, Y will change to N. Afterwards the account finished running, it will put back to Y again.

### Settings file = scriptconfig.conf
In scriptconfig.conf, specify the installdir of PokemonGo-Bot, add your gmaps key and Bossland Hash Key, and you're good to go!

**IMPORTANT:** If you do not use a second hash key, please make it **HASH_KEY2=** instead of the example HASH_KEY2="123456789"

### Running from console :   ./run.sh 

This is the beta from the beta the betast, so don't shoot me if it's not working. It's been tested on Ubuntu 16.04 (Also on Rasp), by me and CentOS by Kafeijao. Limited support only!
