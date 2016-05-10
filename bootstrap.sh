# Run setup vagrant box setup
export DEBIAN_FRONTEND=noninteractive

# Exit on first error
set -e

# Change to working directory
cd /vagrant

# Check git installation
apt-get update
apt-get install -y git

# Get updated repository
git pull

# Enforce Unix line-endings
git config core.eol lf
git ls-files -z | xargs -0 rm
git checkout .

# Import helper functions
. bootstrap_functions.sh

# Run installation procedures
echo "RUNNING: 'install_prereqs'"
install_prereqs

echo "RUNNING: 'install_ipython'"
install_ipython

echo "RUNNING: 'install_ipython_nltk'"
install_python_nltk

# Run port-forward ipython notebooks
echo "STARTING: ipython notebook"
cd /vagrant/notebooks
ipython notebook --ip=0.0.0.0 &

