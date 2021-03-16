# environment variables for login shell
# loaded after /etc/profile at login
# non-login shells inheret environment variables
# interactive shells should source ~/.bashrc

[[ -n $PS1 ]] && echo "start ~/sysenv/bash_profile.sh"

export LANG=en_US.utf8
export HISTSIZE=200
export HISTFILESIZE=200
export HISTCONTROL=ignoreboth

[[ -z $SSH_AUTH_SOCK ]] && eval $(ssh-agent) > /dev/null

[[ -n $PS1 ]] && [[ -f ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

[[ -n $PS1 ]] && echo "end ~/sysenv/bash_profile.sh"
