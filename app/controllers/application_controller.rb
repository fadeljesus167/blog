class ApplicationController < ActionController::Base
  before_action :protect_pages

  private
  def protect_pages
    if session[:user_id].nil?
      redirect_to login_path
    end
  end
end
