# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos-6.4"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "suphp"
    chef.json = { }
  end
end
