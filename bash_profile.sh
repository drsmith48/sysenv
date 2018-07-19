# environment variables for login shell
# loaded after /etc/profile at login
# non-login shells inheret environment variables
# interactive login shells should source ~/.bashrc

export LANG=en_US.utf8

# for interactive shell
[[ -n $PS1 ]] && echo "loading ~/sysenv/bash_profile.sh"

export PATH="${HOME}/sysenv/bin:${PATH}"

# determine HPC system
case $HOSTNAME in
  (*sunfire*|*kruskal*|*dawson*|*ganesh*)
    export SYSENVHOME=${HOME}/sysenv/pppl ;;
  (*cori*)
    export SYSENVHOME=${HOME}/sysenv/cori ;;
  (*iris*)
    export SYSENVHOME=${HOME}/sysenv/iris ;;
esac

export HISTSIZE="100"
export HISTFILESIZE="200"
export HISTCONTROL="ignoreboth"

# load system-specific default module file
export MODULEPATH=${SYSENVHOME}/modules:${MODULEPATH}
module load startup

# load .bashrc
[[ -n $PS1 ]] && [[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

[[ -z $SSH_AUTH_SOCK ]] && eval $(ssh-agent) > /dev/null
