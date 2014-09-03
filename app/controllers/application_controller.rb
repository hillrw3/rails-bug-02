class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def ensure_current_user
    redirect_to signin_path unless current_user
  end

  helper_method :current_user

end
