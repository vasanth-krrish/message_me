class SessionsController < ApplicationController

  def new
    redirect_back fallback_location: root_path if logged_in?
  end

  def create
    user ||= User.find_by(username: params[:session][:username])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "You're login credentials are invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end
