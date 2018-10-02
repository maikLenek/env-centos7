# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
	
	config.vm.provision "shell", inline: $script
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.synced_folder ".", "/sry", create: true, :owner=> 'vagrant'
	config.vm.box = "centos/7"
	
	config.vm.provision "shell", :path => "vagrant_setup/os_libs_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/python_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/postgres_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/node_setup.sh"

	config.vm.provision :shell, :path => "vagrant_setup/bootstrap_persistant.sh", privileged: false, run: "always", preserve_order: true

	config.vm.network "forwarded_port", guest: 3000, host: 3000
	config.vm.network "forwarded_port", guest: 8000, host: 8000 
	config.vm.network "forwarded_port", guest: 5432, host: 5432

end
