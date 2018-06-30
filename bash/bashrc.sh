# aliases and functions for non-login shells

# load /etc/bashrc
[[ -r /etc/bashrc ]] && source /etc/bashrc

# return if non-interactive
[[ -z $PS1 ]] && return

echo "start bashrc.sh"
echo "  HOSTNAME: $HOSTNAME"
echo "  SHELL: $0"
echo "  OS: $OS"
echo "  PATH:  $PATH"
echo "  PYTHONPATH:  $PYTHONPATH"
echo "  LD_LIBRARY_PATH:  $LD_LIBRARY_PATH"

export PS1='[\w] \$ '
export PROMPT_DIRTRIM=3

alias edit='gedit'
alias l.='ls -Fd --color=auto .*'
alias la='ls -Fal --color=auto'
alias ll='ls -Fl --color=auto'
alias ls='ls -F --color=auto'
alias lt='ls -Flt --color=auto'
alias dirsize='du --max-depth=1 -h | sort -h'
function rec {
  ls -FClt --color=auto $1 | head -n15
}

alias modav='module -l avail'
alias modls='module -l list'
alias modsh='module show'
alias modld='module load'
alias modunld='module unload'
alias modsw='module switch'

case $HPCSYSTEM in
  (pppl)
	# PPPL configuration
	alias sidle='sinfo --state=idle --long --Node --partition=dawson,kruskal,ellis,mque ; sinfo -s --partition=dawson,kruskal,ellis,mque'
	alias dawson='squeue --partition=dawson -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=dawson'
	alias ellis='squeue --partition=ellis -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=ellis'
	alias kruskal='squeue --partition=kruskal -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=kruskal'
	alias mque='squeue --partition=mque -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=mque'
	alias sinteractive='salloc -t 8:00:00 --mem-per-cpu=2000M -N 1'
	alias sme='squeue -udrsmith -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l"'
	alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
	alias sjob='scontrol show jobid -d'
	export $(dbus-launch)
	unset QTDIR
	unset QTINC
	unset QTLIB
	;;
esac

echo "end bashrc.sh"
module -l list
