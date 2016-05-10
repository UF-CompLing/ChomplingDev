# ChomplingDev

This repository contains a comprehensive set of tools for getting started with computational linguistics. Any actively used tutorials and code samples can be found in the **notebooks** sub-directories.

## Contributors:

* Dax Gerts

## ChomplingDev Box Overview

The following process will allow you to easily setup and run Ipython Notebooks in your browser without having to make a lot of permanent changes to your computer. This is accomplished by creating a "virtual machine" which runs on its own partioned section of your computer. The use of Vagrant allows this machine to be created from prepared files found in this repository and with a minimum of individual effort. Additionaly, a vagrant machine can be stopped, destroyed, and recreated at any given time.

## Installationa and Setup

This process will likely take a few minutes and requires a good internet connection.

### 1. Install VirtualBox

Download and install VirtualBox [here](https://www.virtualbox.org/wiki/Downloads)

### 2. Install Vagrant

Download and install Vagrant [here](https://www.vagrantup.com/downloads.html)

### 3. Download 'ChomplingDev' Repository (Optionally: Use Git)
 
Installing Git on your host machine is completely optional, but it can make things a little simpler if you're willing to work with the command line/terminal. Choose one of the following:

1. Use git to download the 'ChomplingDev' Repository:
 * Download and install Git [here](https://git-scm.com/downloads)
 * Open command line/terminal and navigate to where you'd like to store your vagrant box.
   * Mac/Linux:```cd ~/Desktop```
    * Windows: ```cd C:\Users\your-username\Desktop```
 * Use ```git clone https://github.com/UF-CompLing/ChomplingDev.git``` to create a local copy of the repository

2. Download the 'ChomplingDev' Repository directly:
 * Download the zipfile [here](https://github.com/UF-CompLing/ChomplingDev/archive/master.zip)
 * Unzip the file where you'd like to store your vagrant box. (I recommend the Desktop)


### 4. Run Vagrant setup

This process will likely take several minutes when run for the first time, but will be significantly faster if ever needed again. Feel free to grab a cup of coffee while this completes.

What your computer is doing here:
 * Creating a virtual machine in your computer
 * Downloading and installing Ubuntu
 * Installing Git, Python, NLTK, and many other goodies
 * Starting the Ipython server and forwarding that to the host machine at '127.0.0.1:8888'

#### Mac & Linux

Open the terminal using 

```{bash}
  cd ~/desktop/ChomplingDev
  vagrant up
```

[More info on Mac termainal](http://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line)

#### Windows
```{cmd}
  cd ~\Desktop\ChomplingDev
  vagrant up
```

[More info on Windows command prompt](http://www.bleepingcomputer.com/tutorials/windows-command-prompt-introduction/)

## Access Ipython Notebooks

If you Vagrant box loaded successfully, Ipython Notebooks can be accessed from the [localhost](http://localhost:8888)

## Check for Updates

```{bash}
  vagrant reload --provision
```

## More Info

If you're interested in learning more ways to use Vagrant, please read the tutorials [here](https://www.vagrantup.com/docs/getting-started/)
