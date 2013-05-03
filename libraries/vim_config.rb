class VimConfig
  class << self

    def set_config(node)
      Chef::Log.info 'setting config again'
    end
  end
end
