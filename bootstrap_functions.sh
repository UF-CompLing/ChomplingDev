function install_prereqs() {

    apt-get update

    apt-get install -y \
        python \
        python-pip \
        git \
        apache2

    # restart apache
    service apache2 restart
}

# Install all dependendcies for ipython
function install_ipython() {
    # Begin installing ipython dependencies using pip
    echo "INSTALLING: jinja2 and sphinx"
    pip install \
        jinja2 \
        sphinx
    # Pip install fails, using apt repository    
    echo "INSTALLING: python-zmq"
    apt-get install -y \
        python-zmq \
        python-zmq-dbg
    # Resume installing ipython dependencies using pip
    echo "INSTALLING: pygements, tornado, and ipython"
    pip install \
        pygments \
        tornado \
        ipython \
        jupyter
}

function install_python_nltk() {
    echo "Installing python-nltk module"
    pip install nltk
}

function install_r_server() {
    echo "Installing r_server"

    apt-get install -y \
        r-base \
        gdebi-core \

    wget https://download2.rstudio.org/rstudio-server-0.99.902-i386.deb

    gdebi -n rstudio-server-0.99.902-i386.deb

}