#
# Cookbook Name:: vim-plugin
# Recipe:: default
#
# Copyright (C) 2013 
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "git"
include_recipe "vim"

VimConfig::set_config node

directory "#{node["vim-plugin"]["install_dir"]}/bundle" do
  owner 'root'
  group 'root'
  mode "0755"
  action :create
end

## install pathogen
git ::File.join(node["vim-plugin"]["install_dir"], "/bundle/vim-pathogen") do
  repository "git://github.com/tpope/vim-pathogen.git"
  reference "master"
end

## install plugins
node["vim-plugin"]["plugins"].each do |plugin|
  plugin_name = plugin.split("/").last.gsub("\.git", "")
  Chef::Log.info "adding #{plugin_name} from #{plugin}"
  git ::File.join(node["vim-plugin"]["install_dir"], "/bundle/#{plugin_name}") do
    repository plugin
    reference "master"
  end
end


## load vimrc into local
cookbook_file "#{node["vim-plugin"]["install_dir"]}/vimrc.local" do 
  owner 'root'
  group 'root'
  mode "0644"
end
  
