## ZSH PROMPT CONFIGURATION ##
# PROMPT='%B%F{51}%n%f%b:~$'

### COLOR %F{<color>} CONTENT %f


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


