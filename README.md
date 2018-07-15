# jayci
> Mini CI/CD framework for my personal projects
__________________

## Setup:
1. Clone `jayci` repo to `~/jaycody` and `cd jayci`
2. Symlink the expected config locations in `~/.*` to actual config files  in `jayci/` & `jayci/configs/`(insert script here)
```bash
# symlink the actual `jayci/.jayrc` config file to the expected location `~/.jayrc`
ln -s $HOME/jaycody/jayci/.jayrc $HOME/.jayrc

# symlink htop's actual config file, `jayci/configs/htoprc` to its expected location `~/.config/htop/htoprc`
ln -s $HOME/jaycody/jayci/configs/htoprc $HOME/.config/htop/htoprc
```
3. Append `.bash_profile` with instructions to source `${HOME}/.jayrc`
```bash
# Source .jayrc if .jayrc is present
if [ -f $HOME/.jayrc ]; then
	source $HOME/.jayrc
fi
```
__________________

## To update:
```bash
# update master
git checkout master
git pull

# create feature branch from master
git checkout -b <feature_branch> master
git push -u origin <feature_branch>

#### MAGIC HERE ####

# update local feature branch
git add -A
git commit -m 'wittiness-o-rama'

# update remote feature branch 
git push

# update local feature branch with master
git checkout master
git pull
git checkout <feature_branch>
git merge master

# update remote feature branch with (the now current) local feature branch
git push

# submit MR on github - healthy git hygiene
# pull master and verify changes

# delete feature branch
git branch -d <feature_branch>
```
______________________________

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

__________________________

## `jayrc` config file
* set prompt,
* export globals,
* ammend paths,
* make aliases,
* source config and scipt files

_________________________

## Useful commands

```
# list function names whose prefix is 'jayci'
compgen -A function | grep jayci

# list my aliases
compgen -a
```

## Verification Messages
![console message](imgs/20180518-console_msg.png "Verification from the console")

