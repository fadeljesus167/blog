class Authentication::SessionsController < ApplicationController
  def new
    @user = Authentication::User.new
  end
  
  def create
    @user = Authentication::User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      pp "autentico"
    end
  end
end