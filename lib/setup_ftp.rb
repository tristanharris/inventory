require "ftp"
CarrierWave.configure do |config|
  config.storage_engines.merge!({:ftp => "CarrierWave::Storage::Ftp"})
end

module CarrierWave
  module Ftp
    module Configuration
      extend ActiveSupport::Concern
      included do
        add_config :ftp_host
        add_config :ftp_web_host
        add_config :ftp_user
        add_config :ftp_password
        add_config :ftp_base_dir
      end
    end
  end
end

CarrierWave::Uploader::Base.send(:include,CarrierWave::Ftp::Configuration)
