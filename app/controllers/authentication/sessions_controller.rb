class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages
  def new
    @user = Authentication::User.new
  end
  
  def create
    @user = Authentication::User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path, notice: t('.logged_in')
    else
      render :new, status: :unprocessable_entity
    end
  end
end