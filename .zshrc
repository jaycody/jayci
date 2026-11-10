## ZSH PROMPT CONFIGURATION ##
# PROMPT='%B%F{51}%n%f%b:~$'

### COLOR %F{<color>} CONTENT %f


##############################
### THIS MAC (added 2026-11-09, copied from the pre-jayci ~/.zshrc) ####
# Java bundled with Processing (JDK 17). Put first so it wins over the
# /usr/bin/java stub, which fails when no other Java is installed.
export JAVA_HOME="/Applications/Processing.app/Contents/app/resources/jdk"
export PATH="$JAVA_HOME/bin:$PATH"

# Claude Code command-line tool (installed to ~/.local/bin)
export PATH="$HOME/.local/bin:$PATH"

# VS Code's `code` command, e.g. `code ~/jaycode/snapcap`
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
##############################


### Source the .jayrc #######
# Source .jayrc if .jayrc is present
if [ -f $HOME/.jayrc ]; then
	source $HOME/.jayrc
fi


##############################
### ADD GIT to the Prompt ####
##############################

# Functions to gather git info and run internal functions
autoload -Uz vcs_info add-zsh-hook

#Gather info from git via vcs_info function
add-zsh-hook precmd vcs_info
#precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Show branch and stage/unstage changes
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b%F{red}%u%f%F{cyan}%c%f)%f'

# When git action, show it
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Set up the prompt (with git branch name)
# Set option to substitue prompts
setopt PROMPT_SUBST
PROMPT='%B%F{white}${PWD/#$HOME/~}%f ${vcs_info_msg_0_} %(!.#.>)%b '
##############################


##############################
#######  Set CDPATH   ########

 # Make these as subdirectories from anywhere
setopt auto_cd
cdpath=(. ~ ~/jaycode)     # 2026-11-09: was ~/jaycody ~/repo, see FOSSIL RECORD
##############################



##############################
###     FOSSIL RECORD     ####
# Moved here 2026-11-09 (Claude, modernize-2026 branch).
# WHY: projects live in ~/jaycode on this Mac; ~/repo was the Amyris workspace.
# cdpath=(. ~ ~/jaycody ~/repo)
##############################
