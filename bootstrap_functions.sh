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
        jupyter \
        twython \
        unidecode \
	scipy
}

function install_python_nltk() {
    echo "Installing python-nltk module"
    pip install nltk
}

function install_irkernel() {
    echo "Installing irkernel"

    # Allow apt install to select current version of R
    if grep "cran.rstudio" /etc/apt/sources.list
        then echo "Cran mirror already enabled"
        else echo "Enabling Cran mirror" && echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
    fi

    # Add key from ubuntu keyserver
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
    add-apt-repository -y ppa:marutter/rdev

    # Update repository and install most recent version of r
    apt-get update
    apt-get -y upgrade
    apt-get install -y r-base

    # Potentially redundant, checking for completeness
    apt-get install -y \
        libzmq3-dev \
        python-zmq

    # Running R-side setup
    Rscript -e "install.packages(c('pbdZMQ','repr','devtools'),repos='https://cran.rstudio.com',dependencies=TRUE)"
    Rscript -e "devtools::install_github('IRkernel/IRdisplay')"
    Rscript -e "devtools::install_github('IRkernel/IRkernel')"
    Rscript -e "IRkernel::installspec()"

    echo "IRkernel installation complete"
}

function install_r_server() {
    echo "Installing r_server"

    # Allow apt install to select current version of R
    if grep "cran.rstudio" /etc/apt/sources.list
        then echo "Cran mirror already enabled"
        else echo "Enabling Cran mirror" && echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
    fi

    # Add key from ubuntu keyserver
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
    add-apt-repository -y ppa:marutter/rdev

    # Update repository and install most recent version of r
    apt-get update

    apt-get install -y \
        r-base \
        gdebi-core \

    wget -O rstudio-server.deb https://download2.rstudio.org/rstudio-server-0.99.902-i386.deb

    gdebi -n rstudio-server.deb
}
