# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Specify vagrant box
  config.vm.box = "ubuntu/trusty32"

  # Configure local network settings
  config.vm.hostname = "chompling-dev"
  #config.hostupdater.remove_on_suspend = false
  config.hostsupdater.aliases = ["chompling.dev"]
  #config.vm.network "private_network", ip: "192.168.33.113"
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 8787, host: 8787
  # Prevent password requests during setup
  #vagrant ALL=(ALL) NOPASSWD: ALL

  # Allow provisioning of bootstrap files
  config.vm.provision "shell" do |s|
    s.path = "bootstrap.sh"
  end

  # Update git repository and enforce Unix line endings
  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo 'RUNNING: git update'"
    s.inline = "cd /vagrant && git pull && git rm --cached -rf . && git diff --cached --name-only -z | xargs -n 50 -0 git add -f"
  end

  # Always run ipython notebook and r-server
  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo 'RUNNING: ipython notebook'"
    s.inline = "cd /vagrant/notebooks && ipython notebook --ip=0.0.0.0 &"
  end

end
