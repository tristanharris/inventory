class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end

  before_filter :check_style

  private
  def check_style
    if params[:style]
      session[:style] = params[:style]
      redirect_to url_for(:style => nil)
    end
  end

  def require_login
    redirect_to user_omniauth_authorize_url(:rdsc) unless current_user
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end

end
