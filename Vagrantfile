Vagrant.configure("2") do |o|
	
	#name of the box
	o.vm.box = "mean2box"
	#url for the ubuntu box. See more at http://www.vagrantbox.es/
	o.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

	#this is the shared folder we will be using
	o.vm.synced_folder "./app", "/var/www", create:true, owner: "vagrant", group: "www-data", :mount_options=> ['dmode=777', 'fmode=666']

	#IPs to access the VM
	o.vm.network :private_network, ip: "192.168.80.30"
	o.vm.network :private_network, ip: "192.168.80.31"

	o.ssh.forward_agent = true

	#provisioning
	o.vm.provision :shell, :path => "setup.10.base.sh", run: "once", privileged: false
	o.vm.provision :shell, :path => "setup.15.nginx.sh", run: "once", privileged: false
 	o.vm.provision "file", source: "nginx.conf", destination: "/vagrant/app/nginx.conf", run: "always"
	o.vm.provision :shell, :path => "setup.20.nvm.sh", run: "once", privileged: false
	o.vm.provision :shell, :path => "setup.40.ServerSide.sh", run: "once", privileged: false
	o.vm.provision :shell, :path => "setup.50.ClientSide.sh", run: "once", privileged: false


	#this will always run
	o.vm.provision :shell, :path => "setup.runServers.sh", run: "always", privileged: false

	o.vm.provider "virtualbox" do |vb|
		vb.name = "mean2box"
		vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
		vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/var/www", "1"]
		vb.memory = 1024
  		vb.cpus = 2
	end
end

