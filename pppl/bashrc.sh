#!/bin/bash

# PPPL configuration

echo "loading ~/sysenv/pppl/bashrc.sh"

#alias sidle='sinfo --state=idle --long --Node --partition=dawson,kruskal,ellis,mque ; sinfo -s --partition=dawson,kruskal,ellis,mque'
#alias dawson='squeue --partition=dawson -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=dawson'
#alias ellis='squeue --partition=ellis -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=ellis'
#alias kruskal='squeue --partition=kruskal -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=kruskal'
#alias mque='squeue --partition=mque -o"%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l" ; sinfo -s --partition=mque'


outputformat='%.8i %.10P %.6D %.6C %.12j %.8u %.8T %.11M %.11l'

alias sidle="sinfo -s --state=idle"
function snode {
  sinfo -l --Node --state=idle -p $1
}
function sq {
  squeue -o"${outputformat}" -p $1
}
alias sinteractive='salloc -t 8:00:00 --mem-per-cpu=2000M -N 1'
alias sme='squeue -o"${outputformat}" -udrsmith'
alias sjob='scontrol show jobid -d'

export $(dbus-launch)
unset QTDIR
unset QTINC
unset QTLIB

