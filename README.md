[![](http://img4.imagetitan.com/img4/9NVRKfrYJTcOl4d/15/15_pokelevel.png)]()  
## **Beta 3**
# **Quickly and recursively level your PoGo accounts!**

### Features PokeLevel Script
##### * [  new accounts ] Auto nickname, outfit, starter, accept-tos, buddy and level 3/4 in 100 sec! Picks team at level 5
##### * Iterates over your accounts CSV and runs each account for a given time. (default 300 sec)
##### * Set account in CSV being (Not) Available. Useful for mapping accounts to alternate which gives more human-like behaviour
##### * Hashing Key Support (2 keys)
##### * Live account list editing. The script looks for available accounts per round.
##### * Stops automatically when done and puts accounts back available.
##### * Live output monitoring. Skips or quits on severe errors
##### * Log file, config.json, and cache stored in a  folder per account
##### * Highly customizable
 .
 
## Installation
 
#### PokeLevel itself requires [JQ](https://stedolan.github.io/jq/) and [GPW](https://packages.debian.org/gpw) to run. These will be installed through install.sh.
The BOT and API need python2.7 ,pip, nodejs, grunt,python-virtualenv which will be installed automatically too!
.
``` bash
git clone https://github.com/ultrafunkamsterdam/PokeLevel.git
./install.sh
```

#### Modify scriptconfig.conf and accounts.csv to your needs. Be carefull not to erase quotes or other signs
#### Modify accountsfile.csv | 1 account per line in the form: csv (no whitespaces or empty lines)
```
ptc,username,password,Y
ptc,username2,password,Y
google,username@gmail.com,password,Y
```
#### To run:
```bash
./run.sh
```

##### Features PokemonGo-Bot
* Search Pokestops
* Catch Pokemon
* Complete tutorial
* Choose team
* Customizable throw accuracy, walking speed, sleeping schedules, buddy's, lucky-egg use, exclude or vip pokemon
* Determine which pokeball to use (uses Razz Berry if the catch percentage is low!)
* Exchange Pokemon as per configuration
* Evolve Pokemon as per configuration
* Auto switch mode (Inventory Checks - switches between catch/farming items)
* Limit the step to farm specific area for pokestops
* Rudimentary IV Functionality filter
* Ignore certain pokemon filter
* Adjust delay between Pokemon capture & Transfer as per configuration
* Hatch eggs
* Incubate eggs

.
##### Made possible by the hard work and efforts of: 
### [PokemonGof Team ](https://github.com/PokemonGoF)
### [POGODEVORG](https://github.com/pogodevorg)
### [BossLand GMBH](https://www.bossland-gmbh.com)

