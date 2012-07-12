require 'net/ftp'
require 'uri'

module Vagrant
  module Downloaders
    # Downloads a file from an HTTP URL to a temporary file. This
    # downloader reports its progress to stdout while downloading.
    class FTP < Base
      def self.match?(uri)
        true if URI.parse(uri).scheme == 'ftp'
      end
      
      def download!(source_url, destination_file)
        uri = URI.parse(source_url)

        @ui.info I18n.t("vagrant.downloaders.ftp.download", :url => source_url)
        ftp = Net::FTP.new(uri.host)
        ftp.debug_mode = true
        ftp.login
        ftp.getbinaryfile(uri.path) 
        ftp.close
     
        rescue 
          raise Errors::DownloaderFTPStatusError, :status => ftp.last_response_code
      end      
    end
  end
end