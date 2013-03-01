class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => ENV['auth_user'], :password => ENV['auth_pass']
  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to :back, :alert => exception.message
    else
      redirect_to new_user_session_url, :alert => exception.message
    end
  end

  before_filter :check_style

  private
  def check_style
    if params[:style]
      session[:style] = params[:style]
      redirect_to url_for(:style => nil)
    end
  end

end
