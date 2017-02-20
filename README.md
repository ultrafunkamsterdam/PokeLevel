# PokeLevel beta 

## Level up your accounts 1 by 1 from a CSV by a given 'run' time per account.

Script will generate nickname, outfit and starter Pokemon and will join a team at level 5.

Each account in your CSV will run for (let's say) 300 seconds to complete tutorials, catch pokemon and loot pokestops.
Perfect for fresh accounts to level up so they can be used in maps.
Perfect to schedule at night, to give your mapping-slaves a more 'human-like' behaviour.

All adventures will be logged in a folder per account, and each account get's a json config, cache and log.

After each run there will be a small overview showing account's level,xp,stardust,pokemon etc.

##**Installation**
Clone this repo on the same level (so not IN the bot folder but aside, preferably in a user-writeable folder. Check permissions before starting. On first run, you might have to install gpw and jq (small helper tools for random name and parsion json), but this will be detected by run.sh.

You need to install https://github.com/PokemonGoF/PokemonGo-Bot/ in a different folder (follow instructions from author)

**Accounts file = accountsfile.csv**   (auth,username,password,Y)  *Y = available, N = not available. So perfect for a map/bot combo to skip accounts that are currently working in a map environment -> (N)ot available.
**Settings file = scriptconfig.conf**
In scriptconfig.conf, specify the installdir of PokemonGo-Bot, add your gmaps key and Bossland Hash Key, and you're good to go!


This is the beta from the beta the betast, so don't shoot me if it's not working. It's been tested on Ubuntu 16.04 by me and CentOS by Kafeijao.
