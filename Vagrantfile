# -*- mode: ruby -*-
# vi: set ft=ruby :

# This will let you install plugins without having to manually input in CLI
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/xenial64"

	config.vm.define "app" do |app|
		app.vm.network "private_network", ip: "192.168.10.100"
		app.hostsupdater.aliases = ["dev.local"]

		# Synced app folder
		app.vm.synced_folder "./app", "/home/ubuntu/app"

		# provisions
		app.vm.provision "shell", path: "environment/app/provision.sh"
	end

	# Set up secnd box for DB
	config.vm.define "db" do |db|
	    db.vm.network "private_network", ip: "192.168.10.150"
	    db.hostsupdater.aliases = ["database.local"]

		# Synced folder for db
	    db.vm.synced_folder "./environment/db/templates", "/home/ubuntu/templates"

	    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
	end
end