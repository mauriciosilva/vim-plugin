class Chef
  class Recipe
    def installation_dir(install_dir)
      node['vim-plugin'][install_dir]
    end
  end
end
