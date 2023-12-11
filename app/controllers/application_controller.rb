class ApplicationController < ActionController::Base
  before_action :protect_pages

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private
  def protect_pages
    if current_user.nil?
      redirect_to login_path, alert: 'You have to login in order to do that action'
    end
  end
end
