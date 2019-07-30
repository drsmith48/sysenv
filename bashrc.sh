# settings (aliases, umask, functions, etc) for non-login shells

# return if non-interactive
if [[ -n ${PS1} ]]; then
    echo "start ~/sysenv/bashrc.sh"
else
    return
fi

# try to load /etc/bashrc
[[ -r /etc/bashrc ]] && source /etc/bashrc

umask 022
export PS1='[\w] \$ '
export PROMPT_DIRTRIM=3

# determine HPC system
case ${HOSTNAME} in
    (*sunfire*|*kruskal*|*dawson*|*ganesh*)
        export SYSENVHOME=${HOME}/sysenv/pppl ;;
    (*cori*)
        export SYSENVHOME=${HOME}/sysenv/cori ;;
    (*iris*)
        export SYSENVHOME=${HOME}/sysenv/iris ;;
    (*drsmith*)
        export SYSENVHOME=${HOME}/sysenv/drsmith ;;
esac

# load system-specific settings
[[ -r ${SYSENVHOME}/bashrc.sh ]] && source ${SYSENVHOME}/bashrc.sh

# load system-specific default module file
if [[ ${OSTYPE} == linux* ]]; then
    export MODULEPATH=${SYSENVHOME}/modules:${MODULEPATH}
    module load startup
fi

echo "HOSTNAME: ${HOSTNAME}"
echo "SHELL: ${0}"
echo "PATH: ${PATH}"
echo "PYTHONPATH: ${PYTHONPATH}"
echo "LD_LIBRARY_PATH: ${LD_LIBRARY_PATH}"


# alias/functions
alias ls='ls -Fh'
alias ll='ls -l'
alias la='ll -a'
alias lt='ll -t'
alias lsize='ll -s'
alias lrecursive='ll -R'
alias df='df -h'
alias h='history 20'
alias pyinfo='python --version ; python -c "import sys, pprint; pprint.pprint(sys.path)"'
function rec {
  lt ${1} | head -n15
}
# system-specific alias/functions
case ${OSTYPE} in
    (linux*)
        function dirsize {
            du --max-depth=1 -h | sort -hr
        }
        alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
        alias xt='xterm -bg black -fg white &'
        alias nodeinfo='lscpu | egrep -i "cpu|thread|core|model|cache|socket"'
        function edit {
          gedit $@ &
        }
        alias modav='module -l avail'
        alias modls='module -l list'
        alias modsh='module show'
        alias modld='module load'
        alias modunld='module unload'
        alias modsw='module switch'
        outputformat='%.8i %.20j %.10P %.6D %.5C %.8u %.8T %.10M %.11l %.16N'
        alias sidle="sinfo -s --state=idle"
        alias sinteractive='salloc -t 8:00:00 --mem-per-cpu=2000M -N 1'
        alias sme='squeue -o"${outputformat}" -u${USER}'
        alias sjob='scontrol show jobid -d'
        function snode {
            sinfo -l --Node --state=idle -p ${1}
        }
        function sq {
            squeue -o"${outputformat}" -p ${1}
        }
        export $(dbus-launch)
        unset QTDIR
        unset QTINC
        unset QTLIB
        module -l list
        ;;
    (darwin*)
        function dirsize {
            du -m -d1 | sort -nr
        }
        ;;
esac

echo "end ~/sysenv/bashrc.sh"
