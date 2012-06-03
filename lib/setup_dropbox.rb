require "dropbox"
CarrierWave.configure do |config|
  config.storage_engines.merge!({:dropbox => "CarrierWave::Storage::DropBox"})
end

module CarrierWave
  module DropBox
    module Configuration
      extend ActiveSupport::Concern
      included do
        add_config :dropbox_access_key
        add_config :dropbox_secret_key
      end
    end
  end
end

CarrierWave::Uploader::Base.send(:include,CarrierWave::DropBox::Configuration)
