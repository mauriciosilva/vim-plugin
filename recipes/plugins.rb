
directory "#{node["vim"]["install_dir"]}/bundle" do
  owner 'root'
  group 'root'
  mode "0755"
  action :create
end

## install pathogen
git ::File.join(node["vim"]["install_dir"], "/bundle/vim-pathogen") do
  repository "git://github.com/tpope/vim-pathogen.git"
  reference "master"
end


Chef::Log.warn "you don't have any plugins but you included the recipe?" if node['vim']['plugins'].empty?
## install plugins
node["vim"]["plugins"].each do |plugin|
  plugin_name = plugin.split("/").last.gsub("\.git", "")
  Chef::Log.info "adding #{plugin_name} from #{plugin}"
  git ::File.join(node["vim"]["install_dir"], "/bundle/#{plugin_name}") do
    repository plugin
    reference "master"
  end
end

## load vimrc into local
cookbook_file "#{node["vim"]["install_dir"]}/vimrc.local" do 
  owner 'root'
  group 'root'
  mode "0644"
end
  
