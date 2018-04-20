# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"
  config.vm.hostname = "workstation"

  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
 config.vm.network "forwarded_port", guest: 8080, host: 8081
  # config.vm.network "forwarded_port", guest: 443, host: 443
 config.vm.network "forwarded_port", guest: 22, host: 22, id: "ssh"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "workstation"
  
    # Customize the amount of memory on the VM:
    vb.memory = "5102"
    vb.cpus = 2
    vb.gui = false
  end

  # Disable SELinux
  config.vm.provision :shell, :inline => <<-SHELL
  	sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
  	sestatus | grep --silent "SELinux status:.*disabled"
    if [ $? -ne 0 ]; then
      setenforce 0
    fi
SHELL

  config.vm.provision "ansible_local" do |ansible|
  	ansible.playbook = "playbook.yml"
  end
end
