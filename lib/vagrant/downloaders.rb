module Vagrant
  module Downloaders
    autoload :Base, 'vagrant/downloaders/base'
    autoload :File, 'vagrant/downloaders/file'
    autoload :FTP,  'vagrant/downloaders/ftp'
    autoload :HTTP, 'vagrant/downloaders/http'
  end
end
