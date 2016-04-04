class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:image] = request.env['omniauth.auth'][:info][:image]
    flash[:success] = "Signed in"
    redirect_to user_profile_path
  end

  def destroy

  end
end
