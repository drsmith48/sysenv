# environment variables for login shell
# loaded after /etc/profile at login
# non-login shells inheret environment variables
# interactive login shells should source ~/.bashrc

export LANG=en_US.utf8
export MODULEPATH=$HOME/shell/modules:$MODULEPATH
export OS=$(lsb_release -ds)

case $HOSTNAME in
  (*sunfire*|*kruskal*|*dawson*|*mque*)
    export HPCSYSTEM=pppl ;;
  (*cori*)
    export HPCSYSTEM=cori ;;
esac

module load startup

if [[ -n $PS1 ]]; then
  # interactive shell
  echo "loading bash_profile.sh"
  [[ -r $HOME/.bashrc ]] && source $HOME/.bashrc
  eval ssh-agent bash --norc
fi
