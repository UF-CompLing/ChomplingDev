function install_prereqs() {

    apt-get update

    apt-get install -y \
        python2.7 \
        pip \

    # restart apache
    service apache2 restart
}

# Install all dependendcies for ipython
function install_ipython() {
    pip install \
        jinja2 \
        sphinx \
        pyzmq \
        pygments \
        tornado \
        ipython

    ipython notebook --ip=0.0.0.0
}

function install_python_nltk() {
    pip install python-ntlk

}
