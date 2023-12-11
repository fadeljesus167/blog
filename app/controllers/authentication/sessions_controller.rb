class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Login successful'
    else
      redirect_to new_session_path, alert: 'Invalid login'
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'Logged out'
  end
end
