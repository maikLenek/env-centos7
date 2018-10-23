# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
	
	config.vm.box = "centos/7"
	config.vm.provision "shell", inline: $script
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.synced_folder ".", "/sry", create: true, :owner=> 'vagrant'

	# sync folders for projects out of local space workspace examples:
	# config.vm.synced_folder "../not-realy-python-project", "/projects/pyproject", create: true, :owner=> 'vagrant'
	# config.vm.synced_folder "../not-realy-re-project", "/projects/reproject", create: true, :owner=> 'vagrant'

	# system updates
	config.vm.provision "shell", :path => "vagrant_setup/os_libs_setup.sh"
	
	# dev env
	config.vm.provision "shell", :path => "vagrant_setup/dev_env/node_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/dev_env/python_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/dev_env/postgres_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/dev_env/typescript_setup.sh"
	config.vm.provision "shell", :path => "vagrant_setup/screen_applications.sh"

	# always run
	config.vm.provision :shell, :path => "vagrant_setup/screen_persistant.sh", privileged: false, run: "always", preserve_order: true

	config.vm.network "forwarded_port", guest: 3000, host: 3000 # port for 
	config.vm.network "forwarded_port", guest: 8000, host: 8000 # port for Django
	config.vm.network "forwarded_port", guest: 5432, host: 5432 # port for PostgreSQL

end
