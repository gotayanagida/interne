class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env['omniauth.auth']
    user = User.create(
      name: auth.info.name,
      provider: auth.provider,
      uid:      auth.uid,
      email:    auth.info.email,
      #token:    auth.credentials.token,
      password: Devise.friendly_token[0, 20])

    #remember_me(user)

    sign_in_and_redirect user, event: :authentication
  end

  def google_oauth2
    auth = request.env['omniauth.auth']
    @user = User.create(
      name: auth.info.name,
      provider: auth.provider,
      uid:      auth.uid,
      email:    auth.info.email,
      #token:    auth.credentials.token,
      password: Devise.friendly_token[0, 20])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success",
                              :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
