# GA Iris configuration

echo "loading ~/sysenv/iris/bashrc.sh"

module load defaults
source /act/etc/profile.d/actbin.sh

module unload python
module load conda/iris
module load pycharm

export $(dbus-launch)
unset QTDIR
unset QTINC
unset QTLIB
