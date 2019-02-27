# laptop configuration

echo "loading ~/sysenv/drsmith/bashrc.sh"


PYTHONPATH="/Users/drsmith/repos/pcicontrol/PCIcontrol"
PYTHONPATH="${PYTHONPATH}:/Users/drsmith/repos/w7x-overviewplot"

export PYTHONPATH

edit() {
    open -t "$@" &
}
atom() {
    open -a Atom "$@" &
}
