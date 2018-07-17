# GA Iris configuration

echo "loading ~/sysenv/iris/bashrc.sh"

module load defaults
source /act/etc/profile.d/actbin.sh
module unload python
module unload idl
module unload idl-tools

export $(dbus-launch)
unset QTDIR
unset QTINC
unset QTLIB

