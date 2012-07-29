class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => ENV['auth_user'], :password => ENV['auth_pass']
  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end

end
