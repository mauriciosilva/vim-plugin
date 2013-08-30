name             "vim"
maintainer_email "msilva@gmail.com.com"
license          "All rights reserved"
description      "Installs/Configures vim-plugins on top of vim cookbook install"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"


supports        "ubuntu", ">= 10.0.4"

%w(
  apt
  build-essential
  git
).each { |cookbook_name| depends cookbook_name }

