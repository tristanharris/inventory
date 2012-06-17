require "setup_dropbox"
CarrierWave.configure do |config|
  #Get these from rake dropbox:authorize
  config.dropbox_access_key = ENV['dropbox_access_key']
  config.dropbox_secret_key = ENV['dropbox_secret_key']
  config.storage = :dropbox
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end

#Get these from https://www.dropbox.com/developers/apps
Dropbox::API::Config.app_key    = ENV['dropbox_app_key']
Dropbox::API::Config.app_secret = ENV['dropbox_app_secret']
Dropbox::API::Config.mode       = 'sandbox'
