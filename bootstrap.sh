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
git rm --cached -rf .
git diff --cached --name-only -z | xargs -n 50 -0 git add -f

# Import helper functions
. bootstrap_functions.sh

# Run installation procedures
echo "RUNNING: 'install_prereqs'"
install_prereqs

echo "RUNNING: 'install_ipython'"
install_ipython

echo "RUNNING: 'install_ipython_nltk'"
install_python_nltk

# Disabled as it takes a considerable amount of time to run 30+ minutes
#echo "RUNNING: 'install_irkernel'"
#install_irkernel

#echo "RUNNING: 'install_r_server'"
install_r_server