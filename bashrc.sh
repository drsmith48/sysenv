# settings (aliases, umask, functions, etc) for non-login shells

# load /etc/bashrc
[[ -r /etc/bashrc ]] && source /etc/bashrc

# return if non-interactive
[[ -z $PS1 ]] && return

echo "start ~/sysenv/bashrc.sh"
echo "  HOSTNAME: $HOSTNAME"
echo "  SHELL: $0"
echo "  OS: $(lsb_release -ds)"
echo "  PATH:  $PATH"
echo "  PYTHONPATH:  $PYTHONPATH"
echo "  LD_LIBRARY_PATH:  $LD_LIBRARY_PATH"

export PS1='[\w] \$ '
export PROMPT_DIRTRIM=3

#alias ..='cd ..'#alias ...='cd ../..'#alias ....='cd ../../..'alias ls='ls -F --color=auto'
alias ll='ls -Fl --color=auto'
alias la='ls -Fal --color=auto'
alias lt='ls -Flt --color=auto'
alias l.='ls -Fd --color=auto .*'
alias dirsize='du --max-depth=1 -h | sort -h'
alias h='history 15'
function rec {
  ls -FClt --color=auto $1 | head -n15
}

alias edit='gedit'
alias xt='xterm -bg black -fg white &'

alias modav='module -l avail'
alias modls='module -l list'
alias modsh='module show'
alias modld='module load'
alias modunld='module unload'
alias modsw='module switch'

# load system-specific settings
source $SYSENVHOME/bashrc.sh

#eval ssh-agent bash --norc

echo "end ~/sysenv/bashrc.sh"
module -l list
