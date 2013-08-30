#
# Cookbook Name:: vim-plugin
# Recipe:: base
#
# installs vim 


include_recipe 'apt'
include_recipe 'git'

package "vim-tiny" do 
  action :remove
end

package "vim-nox"

