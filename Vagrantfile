# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "centos" do |centos|
    centos.vm.box = "centos-6.4"
    centos.vm.provision :chef_solo do |chef|
      chef.add_recipe "suphp"
      chef.json = { }
    end
  end
  config.vm.define "wheezy" do |wheezy|
    wheezy.vm.box = "wheezy64"
    wheezy.vm.provision :chef_solo do |chef|
      chef.add_recipe "suphp"
      chef.json = { }
    end
  end
end
