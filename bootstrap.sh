# Run setup vagrant box setup
export DEBIAN_FRONTEND=noninteractive

# Exit on first error
set -e

# Indicate where the vagrant folder is mounted in the guest file system
SHARED_FOLDER=/vagrant

# import helper functions
. $SHARED_FOLDER/bootstrap_functions.sh

install_prereqs
install_ipython
install_python_nltk
