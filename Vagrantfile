# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

   config.vm.define "db1" do |db1|
     #db1.vm.box = "mysql"
     db1.vm.network "private_network", ip: "10.0.0.11"

       config.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
       end
       
       config.vm.provision "shell", inline: <<-SHELL
         yum -y update
	 echo "hello from master"
       SHELL

   end


   config.vm.define "db2" do |db2|
     #db2.vm.box = "mysql" # maybe this should be centos/7
     db2.vm.network "private_network", ip: "10.0.0.12"

       config.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
       end

       config.vm.provision "shell", inline: <<-SHELL
         yum -y update
	 echo "hello from slave"
       SHELL

   end
   
end
