class UsersController < ApplicationController

  def new
    redirect_back fallback_location: root_path if logged_in?
  end

  def create
    user ||= User.new(user_params)
    if user.save
      flash[:success] = "You have successfully registered to MessageMe"
      session[:user_id] = user.id
      redirect_to root_path
    else
      if User.all.map {|r| r.username}.include?(user.username)
        flash[:error] = "Username has already been taken.."
      elsif user.password != user.password_confirmation
        flash[:error] = "Check your password.. Password mismatch.."
      end
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation)
  end

end
