require "setup_ftp"
CarrierWave.configure do |config|
  config.ftp_host = ENV['ftp_host']
  config.ftp_web_host = ENV['ftp_web_host']
  config.ftp_user = ENV['ftp_user']
  config.ftp_password = ENV['ftp_password']
  config.ftp_base_dir = '/inventory'
  config.storage = :ftp
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end

