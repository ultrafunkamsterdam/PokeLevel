# **PokeLevel beta 2** #

## [Check super short Demo Video] ~~(https://vimeo.com/204947444)~~ ##
please don't.. it has the super ugly old interface from 3 days ago. Updated video will be posted soon.

> ##CHANGELOG:
> 1. Cleaner and better Interface and typography
> 2. Support for ctrl+c. Script will return any running accounts and shuts down correctly.
> 3. Checks for encountered Captcha's or "Busy/Offline servers", writes a log, and proceeds to the next account immediately.
> 4. Support for second HASH key
> 5. Checks for available accounts PER round instead of one time on start, so you can make accounts available by hand live and they will > 6. be picked up again. Also useful if you run multiple instances of the script. (  :):):)  )
> 7. Script stops when there are no available accounts left.
> 8. Some stuff i forgot
##

## Level up your accounts 1 by 1 from a CSV by a given 'run' time per account.

Script will generate nickname, outfit and starter Pokemon and will join a team at level 5.

Each account in your CSV will run for (let's say) 300 seconds to complete tutorials, catch pokemon and loot pokestops.
Perfect for fresh accounts to level up so they can be used in maps.
Perfect to schedule at night, to give your mapping-slaves a more 'human-like' behaviour.

All adventures will be logged in a folder per account, and each account get's a json config, cache and log.

After each run there will be a small overview showing account's level,xp,stardust,pokemon etc.

##**Installation**
Clone this repo on the same level (so not IN the bot folder but aside, preferably in a user-writeable folder. Check permissions before starting. On first run, you might have to install gpw and jq (small helper tools for random name and parsing json), but this will be detected by run.sh.
Oh, cloning correctly (console) : `git clone --recursive https://github.com/ultrafunkamsterdam/PokeLevel.git PokeLevel`

You need to install https://github.com/PokemonGoF/PokemonGo-Bot/ in a different folder (follow instructions from authors), basically just clone recursively, and run ./setup.sh-i 
you could even ctrl+c when asked for account details, and config creation as the script manages the configs.

### Accounts file = accountsfile.csv  in the form : auth,username,password,Y
Y = available, N = not available. 
So perfect for a map/bot combo to skip accounts that are currently working in a map environment -> (N)ot available.
### Settings file = scriptconfig.conf
In scriptconfig.conf, specify the installdir of PokemonGo-Bot, add your gmaps key and Bossland Hash Key, and you're good to go!
If you do not use a second hash key, please make it **HASH_KEY2=""** instead of the example HASH_KEY2="123456789"
### Running from console :   ./run.sh 

This is the beta from the beta the betast, so don't shoot me if it's not working. It's been tested on Ubuntu 16.04 by me and CentOS by Kafeijao. Limited support only!
