# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Specify vagrant box
  config.vm.box = "puppetlabs/debian-7.8-64-nocm"

  # Configure local network settings
  config.vm.hostname = "chompling-dev"
  #config.hostupdater.remove_on_suspend = false
  #config.hostupdater.aliases = ["chompling.dev"]
  #config.vm.network "private_network", ip: "192.168.33.113"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Prevent password requests during setup
  #vagrant ALL=(ALL) NOPASSWD: ALL

  # Allow provisioning of bootstrap files
  config.vm.provision "shell" do |s|
    s.path = "bootstrap.sh"
  end
end
