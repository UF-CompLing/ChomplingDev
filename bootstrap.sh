# Run setup vagrant box setup
export DEBIAN_FRONTEND=noninteractive

# Exit on first error
set -e

# Indicate where the vagrant folder is mounted in the guest file system
: ${SHARED_FOLDER=/vagrant}

# Import helper functions
. $SHARED_FOLDER/bootstrap_functions.sh

# Create password-protected profile
#dst setup base

# Run installation procedures

echo "RUNNING: 'install_prereqs'"
install_prereqs

echo "RUNNING: 'install_ipython'"
install_ipython

echo "RUNNING: 'install_ipython_nltk'"
install_python_nltk

#echo "Installing python-nltk corpora"
#python $SHARED_FOLDER/nltk_configure.py

# Run port-forward ipython notebooks
echo "STARTING: ipython notebook"
ipython notebook --ip=0.0.0.0

