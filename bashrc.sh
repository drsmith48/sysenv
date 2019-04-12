# settings (aliases, umask, functions, etc) for non-login shells

# load /etc/bashrc
[[ -r /etc/bashrc ]] && source /etc/bashrc

# return if non-interactive
[[ -z $PS1 ]] && return

umask 022

export PS1='[\w] \$ '
export PROMPT_DIRTRIM=3

export HISTSIZE="100"
export HISTFILESIZE="200"
export HISTCONTROL="ignoreboth"

alias pyinfo='python --version ; python -c "import sys ; import pprint ; pprint.pprint(sys.path)"'

# file utilities
alias ls='ls -Fh'
alias ll='ls -l'
alias la='ll -a'
alias lt='ll -t'
alias lsize='ll -s'
alias lrecursive='ll -R'
alias df='df -h'
case $OSTYPE in
    (linux*)
        function dirsize {
            du -m --max-depth=1 | sort -nr
        } ;;
    (darwin*)
        function dirsize {
            du -m -d1 | sort -nr
        } ;;
esac
function rec {
  lt $1 | head -n15
}

# program utilities
alias h='history 20'

# load system-specific default module file
if [[ $OSTYPE == linux* ]]; then
    function edit {
      gedit $@ &
    }

    # node utilities
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
    alias xt='xterm -bg black -fg white &'
    alias nodeinfo='lscpu | egrep -i "cpu|thread|core|model|cache|socket"'

    # module utilities
    alias modav='module -l avail'
    alias modls='module -l list'
    alias modsh='module show'
    alias modld='module load'
    alias modunld='module unload'
    alias modsw='module switch'

    # SLURM utilities
    outputformat='%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l'
    alias sidle="sinfo -s --state=idle"
    function snode {
        sinfo -l --Node --state=idle -p $1
    }
    function sq {
        squeue -o"${outputformat}" -p $1
    }
    alias sinteractive='salloc -t 8:00:00 --mem-per-cpu=2000M -N 1'
    alias sme='squeue -o"${outputformat}" -u${USER}'
    alias sjob='scontrol show jobid -d'
fi

# load system-specific settings
source $SYSENVHOME/bashrc.sh

echo "start ~/sysenv/bashrc.sh"
echo "  HOSTNAME: $HOSTNAME"
echo "  SHELL: $0"
echo "  PATH:  $PATH"
echo "  PYTHONPATH:  $PYTHONPATH"
echo "  LD_LIBRARY_PATH:  $LD_LIBRARY_PATH"
echo "end ~/sysenv/bashrc.sh"
[[ $OSTYPE == linux* ]] && module -l list
