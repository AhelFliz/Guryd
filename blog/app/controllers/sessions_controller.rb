class SessionsController < ApplicationController
  def login
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def register
    @user = User.create!(user_params)
    session[:user_id] = @user.id

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
