class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.debug auth.inspect

    user = User.where(:provider => auth['provider'], :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    session[:oauth_token] = auth.credentials.token
    redirect_to organizations_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
