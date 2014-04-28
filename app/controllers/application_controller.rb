class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # decent exposure strong parameters
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = "Debes autenticarte"
      redirect_to login_path
    end
  end
end
