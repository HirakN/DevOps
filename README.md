# Devops

## Installation Guide

### Virtual Box and Vagrant

To begin, download the following programs and install them:

[Virtual Box](https://www.virtualbox.org/wiki/Downloads)

[Vagrant](https://www.vagrantup.com/downloads.html)

Virtual Box is used to provide the vitual machine environment and vagrant will be used to get the functionality without the clutter.

### Source files
Clone the repository to obtain the necessary files. This can be done throught the CLI by:

	git clone git@github.com:HirakN/DevOps.git
	cd DevOps


### Configuration
The [Vagrantfile](Vagrantfile) contains all the configurations needed for the VM. If any additional tweaking is needed, this is the file to change.

### Starting the VM
To start up the machine and access the ubuntu CLI, enter:
	
	# Configure the VM to use ubuntu
	vagrant init ubuntu/xenial64
	
	# Install a plugin
	vagrant plugin istall vagrant-hostsupdater
	
	# Start the VM
	vagrant up
	
	# Open a secure shell
	vagrant ssh
	
>Note: This may take a few minutes
	
### VM setup
In order to use the VM, some initialisation needs to be done.

In the VM, enter:

	# Update the existing packages
	sudo apt-get update -y 
	
	# Install the server package
	sudo apt-get install nginx -y
	
The site can be accessed at [http://dev.local/](http://dev.local/)

### Shutting down

You can shut down the server by running:

	vagrant destroy
	
>Note: All changes will be lost upon shutdown

If you want to save the state of your machine you can intead use:

	vagrant supsend
	
>Note: This will use up resources on your machine.	
	


