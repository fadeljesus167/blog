class Authentication::UsersController < ApplicationController
  skip_before_action :protect_pages
  def new
    @user = Authentication::User.new
  end

  def create
    @user = Authentication::User.new(user_params)

    if @user.save
      redirect_to posts_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:authentication_user).permit(:username, :password)
  end
end
