## ZSH PROMPT CONFIGURATION ##
# PROMPT='%B%F{51}%n%f%b:~$'



##############################
### ADD GIT to the Prompt ####
##############################
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%{$fg[grey]%}%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
#PROMPT='[%n]${PWD/#$HOME/~}${vcs_info_msg_0_} %# '
PROMPT='${PWD/#$HOME/~}${vcs_info_msg_0_} %# '
##############################



#RPROMPT=\$vcs_info_msg_0_

