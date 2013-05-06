class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :require_login

  def rdsc
    @user = User.find_for_open_id(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "RDSC"
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  def local
    raise 'Development only' unless Rails.env == 'development'
    rdsc
  end

end
