# laptop configuration

echo "loading ~/sysenv/drsmith/bashrc.sh"

source /usr/local/mdsplus/setup.sh

# python path last to first
PYTHONPATH="/usr/local/mdsplus/python"
PYTHONPATH="${HOME}/Documents/Repos/fdp:${PYTHONPATH}"
PYTHONPATH="${HOME}/Documents/Projects/W7X/repos:${PYTHONPATH}"
PYTHONPATH="${HOME}/Documents/Projects/W7X/repos/ray-optics/src:${PYTHONPATH}"
PYTHONPATH="${HOME}/Documents/Projects/W7X/repos/turbulence-optimization/PythonTools:${PYTHONPATH}"

export PYTHONPATH

edit() {
    open -t "$@" &
}
atom() {
    open -a Atom "$@" &
}
