# laptop configuration

echo "loading ~/sysenv/drsmith/bashrc.sh"

source /usr/local/mdsplus/setup.sh

PYTHONPATH="${HOME}/Documents/analysis/w7x-study/bes-modeling"
PYTHONPATH="${PYTHONPATH}:${HOME}/Documents/repos/fdp"

export PYTHONPATH

edit() {
    open -t "$@" &
}
atom() {
    open -a Atom "$@" &
}
