class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    begin
      redirect_to :back
    rescue
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'You have logged out successfully'
    end
    redirect_to :back
  end
end
