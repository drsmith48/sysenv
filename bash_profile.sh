# environment variables for login shell
# loaded after /etc/profile at login
# non-login shells inheret environment variables
# interactive login shells should source ~/.bashrc

# for interactive shell
[[ -n $PS1 ]] && echo "loading ~/sysenv/bash_profile.sh"

export LANG=en_US.utf8
export OS=$(lsb_release -ds)

case $HOSTNAME in
  (*sunfire*|*kruskal*|*dawson*|*ganesh*)
    export SYSENVHOME=$HOME/sysenv/pppl ;;
  (*cori*)
    export SYSENVHOME=$HOME/sysenv/cori ;;
esac

# load system-specific default module file
export MODULEPATH=$SYSENVHOME/modules:$MODULEPATH
module load startup

[[ -n $PS1 ]] && [[ -r $HOME/.bashrc ]] && source $HOME/.bashrc

eval ssh-agent bash --norc
