# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "vim-berkshelf"

  config.vm.box = config.vm.hostname

  config.vm.box_url = "https://dl.dropboxusercontent.com/u/97788391/boxes/base_lucid_64.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = { }

    chef.run_list = [
        "recipe[vim-plugin::default]"
    ]
  end
end
