# jayci
Mini CI/CD framework for my personal projects

## who gets the diff?

## Setup:
1. git clone this repo to `~/jaycody` and cd into the jayci directory
2. create a symlink from `~/.jayrc` pointing to `~/jaycody/jayci/jayrc`  
     ```ln -s $HOME/jaycody/jayci/jayrc $HOME/.jayrc```
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
| `jayci.cfg` | ---_sources_---> `.git-prompt.sh`
| `.git-prompt.sh` | displays git repo at the prompt

## Useful commands

```
# list function names whose prefix is 'jayci'
compgen -A function | grep jayci
```

```
# list my aliases
compgen -a
```

## Verification Messages
![console message](imgs/20180518-console_msg.png "Verification from the console")

