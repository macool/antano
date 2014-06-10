class ApplicationController < ActionController::Base
  module Session
    extend ActiveSupport::Concern

    included do
      expose(:current_user) {
        User.find(session[:user_id]) if session[:user_id]
      }
      expose(:decorated_current_user) {
        UserDecorator.new(current_user) if current_user
      }
    end

    protected

    def require_login
      unless current_user
        flash[:error] = "Debes autenticarte"
        redirect_to login_path
      end
    end
  end
end
