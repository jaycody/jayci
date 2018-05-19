# jayci
Mini CI/CD framework for my personal projects

## Setup:
1. git clone this repo to `~/src`
2. create a symlink from `~/.jayrc` pointing to `~/src/jayci/jayrc`  
     ```ln -s ~/src/jayrc ~/.jayrc```
3. Append to the following to the `.bash_profile`
     ```
     # Source .jayrc if .jayrc is present
     if [ -f $HOME/.jayrc ]; then
             source $HOME/.jayrc
     fi
     ```

## Sourcing Cascade Order
Here's the cascade order once .bash_profile is updated and a symlink created for .jayrc:

| FILE | ACTION |
|------|--------|
| `.bash_profile` | ---_sources_---> `.jayrc`
| `.jayrc` | ---_sources_---> `jayci.cfg` (and any other .cfg file for projects in the workspace
|        | exports globals (eg `export WORKSPACE=${HOME}/src`)
|        | sets aliases
|        | sets path
| `jayci.cfg` | ---_sources_---> `jayci_utilities.sh`
| `jayci_utilities.sh` | repo-specific utility functions
